#!/usr/bin/env bash
#
# self-heal.sh — Bounded self-healing loop
# Runs: code → test → fail → summarize error → fix → retry (max 3)
#
# Usage: .ai-pilot/hooks/self-heal.sh <worker> <task-id>
#

set -uo pipefail

MAX_RETRIES=3
TASK_DIR=".ai-pilot/tasks"
RESULT_DIR=".ai-pilot/results"
STATE_FILE=".ai-pilot/state.json"
HOOKS_DIR=".ai-pilot/hooks"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

info()    { echo -e "${CYAN}ℹ${NC}  $1"; }
success() { echo -e "${GREEN}✅${NC} $1"; }
warn()    { echo -e "${YELLOW}⚠️${NC}  $1"; }
error()   { echo -e "${RED}❌${NC} $1" >&2; }

# ─────────────────────────────────────────────
# Update state.json
# ─────────────────────────────────────────────
update_state() {
    local task_id="$1"
    local status="$2"
    local attempt="$3"
    local summary="${4:-}"

    # Create state if not exists
    if [ ! -f "$STATE_FILE" ]; then
        echo '{"version":"2.0.0","current_task":null,"session":{"tasks_completed":0,"tasks_failed":0},"history":[]}' > "$STATE_FILE"
    fi

    local timestamp
    timestamp=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

    # Update current task and last_updated using simple sed
    # For more complex JSON manipulation, we keep it simple
    local temp_file
    temp_file=$(mktemp)

    if [ "$status" = "completed" ] || [ "$status" = "failed" ]; then
        # Task finished — clear current_task, add to history
        cat "$STATE_FILE" | \
            sed "s/\"current_task\":[^,]*/\"current_task\": null/" | \
            sed "s/\"last_updated\":[^,}]*/\"last_updated\": \"$timestamp\"/" \
            > "$temp_file"
        mv "$temp_file" "$STATE_FILE"
    else
        # Task in progress
        cat "$STATE_FILE" | \
            sed "s/\"current_task\":[^,]*/\"current_task\": \"$task_id\"/" | \
            sed "s/\"last_updated\":[^,}]*/\"last_updated\": \"$timestamp\"/" \
            > "$temp_file"
        mv "$temp_file" "$STATE_FILE"
    fi
}

# ─────────────────────────────────────────────
# Run worker
# ─────────────────────────────────────────────
run_worker() {
    local worker="$1"
    local task_id="$2"

    local prompt="Read .ai-pilot/tasks/${task_id}.yaml and execute the task. Write result to .ai-pilot/results/${task_id}.json following the schema in .ai-pilot/schema/result.json"

    case "$worker" in
        claude)
            claude -p "$prompt" --output-format text 2>&1
            ;;
        opencode)
            opencode run "$prompt" 2>&1
            ;;
        aider)
            aider --message "$prompt" --yes 2>&1
            ;;
    esac
    return $?
}

# ─────────────────────────────────────────────
# Run tests
# ─────────────────────────────────────────────
run_tests() {
    if [ -x "$HOOKS_DIR/on-complete.sh" ]; then
        "$HOOKS_DIR/on-complete.sh" 2>&1
        return $?
    fi
    # No hook = assume pass
    return 0
}

# ─────────────────────────────────────────────
# Create fix task from error
# ─────────────────────────────────────────────
create_fix_task() {
    local original_task_id="$1"
    local attempt="$2"
    local error_output="$3"

    local fix_task_id="${original_task_id}-fix-${attempt}"
    local original_task="$TASK_DIR/${original_task_id}.yaml"

    # Read original description
    local original_desc=""
    if [ -f "$original_task" ]; then
        original_desc=$(grep "^description:" "$original_task" | sed 's/description: *//' | tr -d '"')
    fi

    # Truncate error to last 50 lines to save tokens
    local short_error
    short_error=$(echo "$error_output" | tail -n 50)

    cat > "$TASK_DIR/${fix_task_id}.yaml" <<EOF
id: ${fix_task_id}
type: bug-fix
description: "Fix errors from previous attempt. Original task: ${original_desc}"
context: |
  Previous attempt (${attempt}/${MAX_RETRIES}) failed with errors:
  ${short_error}
constraints:
  - Fix ONLY the errors listed above
  - Don't change unrelated code
  - Keep the intent of the original task
EOF

    echo "$fix_task_id"
}

# ─────────────────────────────────────────────
# Main: Self-healing loop
# ─────────────────────────────────────────────
main() {
    if [ $# -lt 2 ]; then
        error "Usage: self-heal.sh <worker> <task-id>"
        exit 1
    fi

    local worker="$1"
    local task_id="$2"
    local current_task_id="$task_id"
    local attempt=1

    echo ""
    echo -e "${BOLD}🔄 Multi-Agent Coding — Self-Healing Mode${NC}"
    echo -e "  Worker:      ${CYAN}$worker${NC}"
    echo -e "  Task:        $task_id"
    echo -e "  Max retries: $MAX_RETRIES"
    echo ""

    while [ $attempt -le $MAX_RETRIES ]; do
        echo -e "${BOLD}━━━ Attempt $attempt/$MAX_RETRIES ━━━${NC}"
        echo ""

        # Step 1: Run worker
        update_state "$current_task_id" "running" "$attempt"
        info "Running $worker on $current_task_id..."

        set +e
        local worker_output
        worker_output=$(run_worker "$worker" "$current_task_id")
        local worker_exit=$?
        set -e

        if [ $worker_exit -ne 0 ]; then
            error "Worker failed (exit: $worker_exit)"
            if [ $attempt -ge $MAX_RETRIES ]; then
                break
            fi
            current_task_id=$(create_fix_task "$task_id" "$attempt" "$worker_output")
            warn "Created fix task: $current_task_id"
            ((attempt++))
            continue
        fi

        success "Worker completed"

        # Step 2: Run tests
        info "Running verification..."

        set +e
        local test_output
        test_output=$(run_tests)
        local test_exit=$?
        set -e

        if [ $test_exit -eq 0 ]; then
            success "All tests passed!"
            update_state "$task_id" "completed" "$attempt" "Passed on attempt $attempt"
            echo ""
            echo -e "${GREEN}${BOLD}✅ Task $task_id completed successfully (attempt $attempt/$MAX_RETRIES)${NC}"
            echo ""
            return 0
        fi

        # Tests failed
        warn "Tests failed (attempt $attempt/$MAX_RETRIES)"
        echo ""

        if [ $attempt -ge $MAX_RETRIES ]; then
            break
        fi

        # Create fix task with error context
        info "Creating fix task from errors..."
        current_task_id=$(create_fix_task "$task_id" "$attempt" "$test_output")
        warn "Fix task: $current_task_id"
        echo ""

        ((attempt++))
    done

    # All retries exhausted
    update_state "$task_id" "failed" "$attempt" "Failed after $MAX_RETRIES attempts"
    echo ""
    echo -e "${RED}${BOLD}❌ Task $task_id failed after $MAX_RETRIES attempts${NC}"
    echo -e "  Check .ai-pilot/results/ and .ai-pilot/tasks/ for details"
    echo ""
    return 1
}

main "$@"
