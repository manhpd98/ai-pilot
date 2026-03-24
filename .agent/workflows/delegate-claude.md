---
description: Delegate coding to Claude Code while Antigravity manages. Use when user says delegate, use claude code, let claude code do it, giao cho claude, dùng claude code.
---

# Delegate to Claude Code

Use this workflow when you want Antigravity (Pilot) to plan and manage while Claude Code (Coder) writes the actual code.

## Steps

1. **Analyze the request** — Fully understand what needs to be done
   - Read relevant files with `view_file`
   - Search codebase with `grep_search`
   - Identify all files that need changes

2. **Create a plan** — Break down into specific, small coding tasks
   - Define the exact changes needed per file
   - Order tasks by dependency (foundations first)

3. **Launch Claude Code** in the project directory:
   ```bash
   cd /path/to/project && claude
   ```

4. **Send specific instructions** — Use prompt templates from SKILL.md
   - One task at a time
   - Include file paths, function names, and constraints
   - Reference existing patterns

5. **Review the output** — Read all modified files
   - Check correctness and style
   - Verify changes match the plan
   - Send corrections if needed

6. **Run tests** — Build and test to ensure nothing is broken
   ```bash
   # Example for web projects
   npm run build && npm test
   ```

7. **Report results** — Summarize changes, decisions, and test results

## Quick Commands

```bash
# One-shot mode (non-interactive, for simple tasks)
claude -p "Add null check to fetchUser() in src/api/user.ts"

# Interactive mode (for complex, multi-step tasks)
claude
```

## When to Use

✅ Use this workflow for:
- Multi-file refactoring
- Complex feature implementation
- Large-scale code changes

❌ Don't use for:
- Single-line fixes (just edit directly)
- Questions about code (just ask Antigravity)
- Non-code tasks
