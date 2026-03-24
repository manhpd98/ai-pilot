---
name: AI Pilot — Multi-Agent Delegation
description: Use Antigravity as project manager (Pilot) to plan, review, and verify code while delegating actual coding to Claude Code, OpenCode, or other AI coding agents via terminal.
---

# AI Pilot — Delegation Skill

Antigravity acts as **Pilot (Manager)** — analyzing, planning, reviewing, and verifying.
Claude Code / OpenCode acts as **Coder (Worker)** — writing and editing code.

## Architecture

```
User Request
    ↓
Pilot (Antigravity)
├── 1. Analyze & Plan
├── 2. Delegate → Coder (via terminal)
├── 3. Review output
├── 4. Verify & Test
└── 5. Report to User
```

## Available AI Workers

| Worker | Command | Best For |
|--------|---------|----------|
| Claude Code | `claude` or `claude -p "prompt"` | Complex edits, refactoring, multi-file |
| OpenCode | `opencode` | Quick tasks, 75+ AI providers |

---

## Step 1: Analyze & Plan (Pilot)

Before delegating anything:
- Understand the user's request fully
- Research the codebase using `grep_search`, `view_file`, `list_dir`
- Create a detailed implementation plan with specific file-level tasks
- Break down into small, actionable items

**Key principle: Never send vague instructions. Always be specific.**

---

## Step 2: Delegate to Coder

### Option A: Interactive Mode (complex tasks)
```bash
cd /path/to/project && claude
```
Then send specific instructions via `send_command_input`.

### Option B: One-Shot Mode (simple tasks)
```bash
claude -p "Your specific instruction here"
```

### Prompt Templates

Use these templates when delegating:

#### 🐛 Bug Fix
```
In file [FILE_PATH], there is a bug in [FUNCTION_NAME]:
- Current behavior: [WHAT_HAPPENS]
- Expected behavior: [WHAT_SHOULD_HAPPEN]
- Root cause: [ANALYSIS]

Fix the bug by [SPECIFIC_CHANGE]. Make sure to:
- Not break existing functionality
- Follow the current code style
- Add error handling if needed
```

#### ✨ New Feature
```
Add [FEATURE_NAME] to [FILE_PATH]:

Requirements:
1. [REQUIREMENT_1]
2. [REQUIREMENT_2]
3. [REQUIREMENT_3]

Follow the existing pattern in [REFERENCE_FUNCTION/FILE].
The new code should be placed [WHERE_IN_FILE].
```

#### ♻️ Refactor
```
Refactor [TARGET] in [FILE_PATH]:

Current issue: [WHAT'S_WRONG]
Goal: [DESIRED_OUTCOME]

Constraints:
- Don't change the public API / function signatures
- Keep all existing tests passing
- Follow [PATTERN_NAME] pattern used in [REFERENCE]
```

#### 🔍 Code Review
```
Review [FILE_PATH] for:
1. Potential bugs or edge cases
2. Performance issues
3. Security vulnerabilities
4. Code style consistency

Provide specific suggestions with line numbers.
```

#### 🧪 Write Tests
```
Write unit tests for [FUNCTION_NAME] in [FILE_PATH]:

Test cases needed:
1. Happy path: [SCENARIO]
2. Edge case: [SCENARIO]
3. Error case: [SCENARIO]

Follow the testing pattern in [EXISTING_TEST_FILE].
Use [TESTING_FRAMEWORK].
```

---

## Step 3: Review Output (Pilot)

After the Coder makes changes:

1. **Read modified files** using `view_file`
2. **Check correctness** — Does it solve the problem?
3. **Check style** — Does it match existing patterns?
4. **Check for bugs** — Edge cases, null checks, error handling?
5. **Check scope** — Did it change only what was needed?

If issues found → send corrections back to the Coder with specific feedback.

---

## Step 4: Verify & Test (Pilot)

Run appropriate verification commands:

| Platform | Build | Test | Lint |
|----------|-------|------|------|
| iOS | `xcodebuild build` | `xcodebuild test` | `swiftlint` |
| Android | `./gradlew assembleDebug` | `./gradlew test` | `./gradlew lint` |
| Web | `npm run build` | `npm test` | `npm run lint` |
| Flutter | `flutter build` | `flutter test` | `flutter analyze` |
| Python | `python -m py_compile` | `pytest` | `flake8` / `ruff` |

Check:
- ✅ Build succeeds with no errors
- ✅ All tests pass
- ✅ No new lint warnings
- ✅ No regressions in related features

---

## Step 5: Report to User

Provide a concise summary:
- What was changed and why
- Decisions made during implementation
- Test results
- Any remaining recommendations

---

## Error Handling

### If Coder makes a mistake:
1. Identify the specific error
2. Send a **correction prompt** with clear instructions:
```
The previous change introduced an issue in [FILE]:
- Problem: [WHAT_WENT_WRONG]
- Fix needed: [SPECIFIC_CORRECTION]
Please fix only this issue without changing other parts.
```

### If Coder is stuck:
1. Provide more context about the codebase
2. Break the task into smaller sub-tasks
3. Reference specific existing code patterns

### If build/tests fail:
1. Read the error output carefully
2. Send the error message to the Coder with context
3. Ask for a targeted fix

---

## Tips

1. **Always plan first** — Vague prompts produce vague code
2. **One task per delegation** — Keep tasks focused and small
3. **Review everything** — The Coder can make mistakes
4. **Include file paths** — Always reference exact paths and function names
5. **Test after each change** — Don't batch untested changes
6. **Use the right tool** — Simple edits → Antigravity directly; Complex → delegate
7. **Provide examples** — Reference existing code patterns for consistency
8. **Iterate** — Send corrections when needed, don't accept mediocre output
