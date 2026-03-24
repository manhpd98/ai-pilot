# Supported AI Workers

All AI coding tools that can be used as the "Coder" in AI Pilot.

## Officially Supported

### Claude Code
- **By**: Anthropic
- **Install**: `npm install -g @anthropic-ai/claude-code`
- **Auth**: Claude Pro ($20/mo), Max ($100/mo), or Team/Enterprise
- **Models**: Claude Opus, Sonnet, Haiku
- **Best for**: Complex refactoring, deep codebase understanding
- **Mode**: Interactive (`claude`) or One-shot (`claude -p "..."`)
- **Website**: [anthropic.com/claude-code](https://www.anthropic.com/claude-code)

### OpenCode
- **By**: Anomaly
- **Install**: `curl -fsSL https://opencode.ai/install | bash`
- **Auth**: Free (includes free models), or BYO API key
- **Models**: 75+ providers — Claude, GPT, Gemini, Llama, and more
- **Best for**: Quick tasks, teams with different AI subscriptions
- **Mode**: Interactive TUI, Web UI, or One-shot (`opencode run "..."`)
- **Website**: [opencode.ai](https://opencode.ai)

## Community Integrations (Contributions Welcome!)

These tools could be integrated. PRs welcome:

| Tool | Type | Notes |
|------|------|-------|
| [Aider](https://aider.chat) | Terminal | Git-aware, pair programming |
| [Cline](https://cline.bot) | VS Code Extension | Autonomous coding agent |
| [Cursor](https://cursor.sh) | IDE | AI-first code editor |
| [GitHub Copilot CLI](https://githubnext.com/projects/copilot-cli) | Terminal | GitHub's AI assistant |
| [Codex CLI](https://github.com/openai/codex-cli) | Terminal | OpenAI's coding agent |

## Adding a New Worker

To add support for a new AI worker:

1. Create a workflow file at `.agent/workflows/delegate-[tool-name].md`
2. Follow the pattern in `delegate-claude.md`:
   - Document the launch command
   - Document how to send tasks
   - Document how to review output
3. Add the tool to the "Available AI Workers" table in `SKILL.md`
4. Submit a PR!
