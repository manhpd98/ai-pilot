---
description: Delegate coding to OpenCode while Antigravity manages. Use when user says use opencode, delegate to opencode, dùng opencode.
---

# Delegate to OpenCode

Use this workflow when you want Antigravity (Pilot) to manage while OpenCode (Coder) writes code. OpenCode supports 75+ AI providers and includes free models.

## Steps

1. **Analyze the request** — Understand requirements, read relevant files
2. **Create a plan** — Break into specific tasks
3. **Launch OpenCode** in the project directory:
   ```bash
   cd /path/to/project && opencode
   ```
4. **Send instructions** — Clear, specific prompts with file paths
5. **Review output** — Verify all changes
6. **Test** — Build and run tests
7. **Report** — Summarize changes

## Quick Commands

```bash
# Interactive TUI
opencode

# Run with a specific message
opencode run "Fix the null pointer in auth.ts"

# Use a specific model
opencode -m anthropic/claude-sonnet-4-20250514

# Web interface
opencode web
```

## OpenCode-Specific Features

- **Multi-session**: Run multiple agents in parallel
- **Share links**: Share any session as a link
- **GitHub Copilot**: Log in with GitHub to use Copilot
- **ChatGPT Plus**: Log in with OpenAI
- **Any model**: 75+ providers via Models.dev

## When to Use

✅ Use OpenCode when:
- You want free AI models
- You need multiple AI providers
- Team uses different AI subscriptions

❌ Use Claude Code instead when:
- You need Claude Opus specifically
- Deep multi-file refactoring is needed
