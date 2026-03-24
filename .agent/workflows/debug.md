---
description: Structured debugging with AI delegation. Use when user says debug, fix crash, tìm lỗi, sửa bug, investigate error.
---

# Debug with AI

Use this workflow to systematically debug issues by having the Pilot analyze and the Coder investigate and fix.

## Steps

1. **Reproduce the issue** — Get exact error and steps to reproduce
   - Copy crash logs / error messages
   - Note the exact steps that trigger the bug
   - Identify which file/function is involved

2. **Analyze the error** (Pilot) — Understand the root cause:
   - Read the relevant source files
   - Trace the execution flow
   - Form a hypothesis

3. **Delegate investigation** to Coder:
   ```bash
   claude -p "Debug this error in [FILE_PATH]:

   Error: [EXACT_ERROR_MESSAGE]

   Steps to reproduce:
   1. [STEP_1]
   2. [STEP_2]

   Hypothesis: [YOUR_ANALYSIS]

   Please:
   1. Trace the code path that leads to this error
   2. Identify the root cause
   3. Propose a fix
   4. Check for similar issues in related files"
   ```

4. **Review the diagnosis** — Verify the Coder's analysis
5. **Delegate the fix** — Send a specific fix request
6. **Test the fix** — Run the app and verify the issue is resolved
7. **Regression check** — Run all tests to ensure nothing else broke

## Debug Template

```
ERROR: [Paste exact error]
FILE: [File where error occurs]
LINE: [Line number if available]
CONTEXT: [What the user was doing]
FREQUENCY: [Always / Sometimes / Rare]

HYPOTHESIS: [Your analysis of the likely cause]

TASK: Investigate and fix this issue.
```

## Common Debug Scenarios

### Crash / Exception
→ Focus on null checks, array bounds, type casting

### UI Bug
→ Focus on state management, layout constraints, render logic

### Performance
→ Focus on loops, API calls, memory usage, unnecessary re-renders

### Data Issue
→ Focus on API responses, data parsing, state mutations
