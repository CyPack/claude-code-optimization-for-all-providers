# Profile Switching Guide

This guide documents the safe toggle flow between Kimi and Claude in Claude Code.

## Goals

- Make provider switch one command.
- Prevent `token + API key` auth conflicts.
- Keep Kimi credentials out of active Claude profile.
- Preserve rollback via timestamped backups.

## Script

- Repository source: `scripts/cc-provider`
- Installed command: `$HOME/.local/bin/cc-provider`
- Aliases:
  - `$HOME/.local/bin/cc-kimi`
  - `$HOME/.local/bin/cc-claude`

## Commands

```bash
cc-provider status
cc-provider kimi
cc-provider claude
```

Planned next command:

```bash
cc-provider minimax
```

Status: roadmap item (not implemented yet).

## What Happens on Switch

### `cc-provider claude`

- Backs up:
  - `$HOME/.claude/settings.json`
  - `$HOME/.claude/settings.local.json`
- Backup path:
  - `$HOME/.claude/backups/provider-switch-YYYYmmdd-HHMMSS-XXXXXX/`
- Saves Kimi key/base URL into:
  - `$HOME/.claude/profiles/kimi-secrets.json` (permission `0600`)
- Updates active config:
  - `model = sonnet`
  - `ENABLE_TOOL_SEARCH = auto:1`
  - Removes Kimi model pin env vars (if currently set to Kimi)
  - Re-enables `ToolSearch` in permissions
  - Removes `ANTHROPIC_API_KEY` and `ANTHROPIC_BASE_URL` from active `settings.local.json`

### `cc-provider kimi`

- Backs up the same files with a new timestamp.
- Restores Kimi credentials from active config or profile stash.
- Updates active config:
  - `model = kimi-for-coding`
  - `ENABLE_TOOL_SEARCH = 0`
  - `ANTHROPIC_DEFAULT_HAIKU_MODEL = kimi-for-coding`
  - `ANTHROPIC_DEFAULT_SONNET_MODEL = kimi-for-coding`
  - `CLAUDE_CODE_SUBAGENT_MODEL = kimi-for-coding`
  - `ANTHROPIC_BASE_URL = https://api.kimi.com/coding/` (unless a saved custom URL exists)
  - Disables `ToolSearch` in permissions

## Validation

```bash
cc-provider status
jq '{model,env,permissions}' $HOME/.claude/settings.json
jq '{env:(.env|keys)}' $HOME/.claude/settings.local.json
claude auth status
```

## Troubleshooting

- If `cc-provider kimi` warns about missing API key:
  - Re-auth with your Kimi flow or set `ANTHROPIC_API_KEY` in local settings.
- If Claude auth is needed after switching:
  - Run `claude /login`.
- If anything breaks:
  - Restore latest files from `$HOME/.claude/backups/provider-switch-*`.
