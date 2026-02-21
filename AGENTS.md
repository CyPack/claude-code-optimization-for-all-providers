# AGENTS.md

This file makes the repository easier for AI agents to consume safely.

## Mission

Understand, validate, and maintain a stable `kimi-for-coding` + Claude Code + MCP workflow using the documents in this repository.

## Priority Read Order

1. `README.md`
2. `docs/README.md`
3. `docs/LESSONS.md`
4. `docs/ACTIONS_LOG.md`
5. `docs/BACKUPS.md`
6. `RELEASE_NOTES.md`

## Ground Truth Files

- Runtime state and mitigations: `docs/README.md`
- Troubleshooting patterns: `docs/LESSONS.md`
- Evidence trail: `docs/ACTIONS_LOG.md`
- Backup/restore references: `docs/BACKUPS.md`

## Key Operational Facts

- Model target: `kimi-for-coding`
- Known issue: `ToolSearch -> tool_reference` may produce HTTP 400 on this stack.
- Stable mitigation: keep `ToolSearch` disabled for this workflow.
- SOR default scope: normal upload flow should not touch `input/File case/` unless user explicitly asks for file case flow.

## Agent Task Checklist

1. Confirm no secrets are introduced.
2. Preserve sanitized format (`$HOME` paths preferred over user-specific absolute paths).
3. Keep troubleshooting steps reproducible.
4. Add clear verification commands for every change.
5. Update `RELEASE_NOTES.md` when behavior/docs change.

## Non-Goals

- Do not store API keys, tokens, or credential files.
- Do not claim success without a concrete verification command/result.
- Do not expand scope into unrelated tools unless requested.

## Suggested Verification Commands

```bash
claude auth status
jq '.permissions | {allow, deny}' $HOME/.claude/settings.json
claude -p "One line: model id only" --output-format text
```
