# Best Practices

Tips and anti-patterns for effective multi-agent coding.

## ✅ Do

### 1. Be Specific in Prompts
```
# Good
"In src/api/user.ts, add null check for user.email on line 42
before calling sendEmail()"

# Bad
"Fix the email bug"
```

### 2. One Task Per Delegation
```
# Good — Focused, reviewable
Task 1: "Create UserService.ts with fetchUser() and updateUser()"
Task 2: "Add error handling to UserService.ts"
Task 3: "Write tests for UserService.ts"

# Bad — Too much at once
"Create UserService, add error handling, write tests,
update the API routes, and fix the dashboard"
```

### 3. Reference Existing Patterns
```
# Good — Clear reference point
"Follow the same pattern used in ProfileService.ts"

# Bad — No reference
"Use the right architecture"
```

### 4. Set Constraints
```
# Good — Clear boundaries
"Don't change the public API. Keep all existing tests passing."

# Bad — No constraints
"Refactor the auth module"
```

### 5. Test After Every Change
Build → Test → Lint after each delegation round. Don't batch untested changes.

### 6. Review Before Accepting
Always read the Coder's changes. Check for:
- Correctness
- Style consistency
- Edge cases
- Unnecessary changes

---

## ❌ Don't

### 1. Don't Send Vague Prompts
Vague prompts produce vague code. Always include file paths, function names, and specific requirements.

### 2. Don't Skip the Review Step
The Coder can make mistakes — wrong files, incomplete changes, subtle bugs. Always review.

### 3. Don't Delegate Everything
Simple one-line fixes are faster to make directly. Only delegate when:
- Multiple files need changes
- Complex logic is involved
- Significant refactoring is needed

### 4. Don't Ignore Build Failures
If the build breaks after a delegation, fix it before moving on. Don't accumulate broken changes.

### 5. Don't Mix Concerns
One delegation = one concern. Don't combine bug fixes with feature additions with refactoring.

---

## When to Delegate vs Direct Edit

| Situation | Approach |
|-----------|----------|
| Fix a typo | Direct edit |
| Change a config value | Direct edit |
| Add a single function | Could go either way |
| Multi-file refactoring | Delegate |
| Complex feature | Delegate |
| Bug requiring investigation | Delegate |
| Writing tests | Delegate |
| Code review | Delegate |
