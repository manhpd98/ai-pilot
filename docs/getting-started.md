# Getting Started

Complete guide to setting up and using AI Pilot.

## Prerequisites

- **Antigravity** — Installed as a VS Code extension
- **Node.js** v18+ — For Claude Code
- One of the following AI workers:
  - **Claude Code** — Requires Claude Pro/Max subscription
  - **OpenCode** — Free, includes free models

## Installation

### Step 1: Install AI Pilot

```bash
# Clone the repo
git clone https://github.com/manhpd98/ai-pilot.git

# Copy to your project
cp -r ai-pilot/.agent /path/to/your/project/
```

### Step 2: Install an AI Worker

#### Claude Code
```bash
npm install -g @anthropic-ai/claude-code
claude  # Follow login prompts
```

#### OpenCode
```bash
curl -fsSL https://opencode.ai/install | bash
source ~/.zshrc  # or restart your terminal
opencode
```

### Step 3: Verify

Open your project in VS Code with Antigravity and try:

> _"List all files in this project"_

Then try delegating:

> _"Use Claude Code to add a comment to the main file"_

## How to Trigger Delegation

Simply include keywords in your request:

| Phrase | Effect |
|--------|--------|
| "delegate to Claude Code" | Uses Claude Code as Coder |
| "use Claude Code" | Uses Claude Code as Coder |
| "delegate to OpenCode" | Uses OpenCode as Coder |

Or use the workflow shortcut:

> _"/delegate-claude fix the login bug"_

## Project Configuration

For platform-specific settings, see:
- [iOS Config](../templates/project-configs/ios.md)
- [Android Config](../templates/project-configs/android.md)
- [Web Config](../templates/project-configs/web.md)
- [Python Config](../templates/project-configs/python.md)

## Next Steps

- Read [Best Practices](best-practices.md) for tips
- Browse [Prompt Templates](../templates/prompt-templates.md) for ready-to-use prompts
- See [Examples](../examples/) for real-world walkthroughs
