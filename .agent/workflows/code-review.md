---
description: AI-powered code review using delegation. Use when user says review code, check code, kiểm tra code, review PR.
---

# AI Code Review

Use this workflow to perform thorough code reviews by having one AI analyze and another verify.

## Steps

1. **Identify files to review** — Gather changed files or target areas
   ```bash
   git diff --name-only HEAD~1   # Recent changes
   git diff --name-only main     # Branch changes
   ```

2. **Send to Coder for review** — Ask for specific analysis:
   ```bash
   claude -p "Review the following files for bugs, security issues, and performance problems:
   - src/auth/login.ts
   - src/api/user.ts
   Provide specific findings with line numbers and severity (critical/warning/info)."
   ```

3. **Analyze findings** — Pilot evaluates the review output:
   - Filter false positives
   - Prioritize by severity
   - Group related issues

4. **Fix critical issues** — Delegate fixes back to the Coder:
   ```bash
   claude -p "Fix the SQL injection vulnerability in src/api/user.ts line 42.
   Use parameterized queries instead of string interpolation."
   ```

5. **Verify fixes** — Run tests and re-review
6. **Report** — Summary of findings and fixes

## Review Checklist

The Coder should check for:
- 🐛 **Bugs** — Logic errors, off-by-one, null references
- 🔒 **Security** — Injection, XSS, auth bypass, data exposure
- ⚡ **Performance** — N+1 queries, memory leaks, unnecessary re-renders
- 📏 **Style** — Naming conventions, dead code, commented-out code
- 🧪 **Testing** — Missing test coverage, untested edge cases
- 📖 **Readability** — Complex logic, missing comments, unclear naming
