# Prompt Templates

Ready-to-use prompt templates for delegating tasks to AI Coders. Copy, fill in the `[BRACKETS]`, and send.

---

## 🐛 Bug Fix

```
BUG FIX REQUEST

File: [FILE_PATH]
Function: [FUNCTION_NAME]
Line: [LINE_NUMBER] (if known)

Current behavior:
[WHAT_HAPPENS_NOW]

Expected behavior:
[WHAT_SHOULD_HAPPEN]

Root cause analysis:
[YOUR_ANALYSIS_OF_WHY]

Steps to reproduce:
1. [STEP_1]
2. [STEP_2]

Fix instructions:
[SPECIFIC_CHANGES_NEEDED]

Constraints:
- Don't modify the public API
- Keep existing tests passing
- Follow the code style in this file
```

---

## ✨ Add Feature

```
FEATURE REQUEST

Feature: [FEATURE_NAME]
File(s): [FILE_PATH_1], [FILE_PATH_2]

Description:
[WHAT_THE_FEATURE_DOES]

Requirements:
1. [REQUIREMENT_1]
2. [REQUIREMENT_2]
3. [REQUIREMENT_3]

Technical approach:
- Add [WHAT] to [WHERE]
- Follow the pattern used in [REFERENCE_FILE:FUNCTION]
- Use [LIBRARY/API] for [PURPOSE]

Acceptance criteria:
- [ ] [CRITERION_1]
- [ ] [CRITERION_2]
- [ ] [CRITERION_3]
```

---

## ♻️ Refactor

```
REFACTOR REQUEST

Target: [FILE_PATH] → [FUNCTION/CLASS/MODULE]

Current issue:
[WHAT'S_WRONG_WITH_CURRENT_CODE]

Goal:
[DESIRED_OUTCOME]

Approach:
[HOW_TO_REFACTOR — e.g., extract method, split class, apply pattern]

Reference:
See [REFERENCE_FILE] for the pattern to follow.

Constraints:
- Don't change public API / function signatures
- Keep all existing tests passing
- Maintain backward compatibility
```

---

## 🔍 Code Review

```
CODE REVIEW REQUEST

Files to review:
- [FILE_1]
- [FILE_2]

Focus areas:
1. Potential bugs or edge cases
2. Security vulnerabilities
3. Performance issues
4. Code style and readability
5. Missing error handling

Output format:
For each finding, provide:
- Severity: CRITICAL / WARNING / INFO
- File and line number
- Description of the issue
- Suggested fix
```

---

## 🧪 Write Tests

```
TEST REQUEST

Target: [FUNCTION_NAME] in [FILE_PATH]
Framework: [jest / pytest / XCTest / JUnit / etc.]

Test cases needed:
1. ✅ Happy path: [NORMAL_SCENARIO]
2. ⚠️ Edge case: [BOUNDARY_SCENARIO]
3. ❌ Error case: [FAILURE_SCENARIO]
4. 🔒 Security: [SECURITY_SCENARIO] (if applicable)

Reference test: [EXISTING_TEST_FILE] for style/pattern

Output: Write complete test file at [TEST_FILE_PATH]
```

---

## 📄 Documentation

```
DOCUMENTATION REQUEST

Target: [FILE_PATH or MODULE_NAME]

Generate:
- Function-level JSDoc/docstring comments
- Module overview at the top of the file
- Usage examples for public functions
- Parameter descriptions with types

Style: Follow [JSDoc / Google Style / NumPy / etc.]
```

---

## 🔄 Migration

```
MIGRATION REQUEST

From: [CURRENT_STATE — e.g., "API v1", "React class components"]
To: [TARGET_STATE — e.g., "API v2", "React hooks"]

Files to migrate:
- [FILE_1]
- [FILE_2]

Migration rules:
1. [RULE_1 — e.g., "Replace componentDidMount with useEffect"]
2. [RULE_2]

Reference: See completed migration in [REFERENCE_FILE]

Constraints:
- Maintain all existing functionality
- Keep tests passing
- One file at a time
```

---

## 💡 Tips for Effective Prompts

1. **Be specific** — Include file paths, function names, line numbers
2. **Provide context** — Explain WHY, not just WHAT
3. **Reference patterns** — Point to existing code to follow
4. **Set constraints** — What NOT to change
5. **One task per prompt** — Don't overload
6. **Include examples** — Show expected input/output when possible
