# Kimi Claude Code Optimization

Public, sanitized operations handbook for running `kimi-for-coding` with Claude Code in a stable, MCP-heavy workflow.

This repo documents what was tested, what failed, what was fixed, and how to keep the setup reliable in daily use.

## What This Repository Does

- Captures a real Kimi + Claude Code integration runbook.
- Documents known failure modes and verified mitigations.
- Provides repeatable verification commands.
- Preserves troubleshooting history in a clean, shareable form.
- Exposes agent-friendly metadata so AI tools can parse and reason over the repo quickly.

## Verified Outcomes

- Claude Code runtime pinned to `kimi-for-coding`.
- MCP tooling available and validated for operational flows.
- Known `ToolSearch -> tool_reference` 400 path identified and mitigated.
- Stable SOR upload path validated with `VoorinfraAPIServer`.
- Scope guard documented so normal SOR upload flow does not touch `input/File case/` unless explicitly requested.

## Who This Is For

- Engineers running Claude Code via Kimi endpoint.
- Teams using MCP-first or agent-heavy workflows.
- Anyone needing a practical troubleshooting baseline instead of theory.

## Quick Start

1. Read `docs/README.md` for current state snapshot.
2. Read `docs/LESSONS.md` for failure patterns and fixes.
3. Read `docs/ACTIONS_LOG.md` for chronology and validation evidence.
4. Read `docs/BACKUPS.md` for backup and restore references.
5. Check `AGENTS.md` and `agent-manifest.json` if you are an AI agent/tool.

## Repository Map

- `docs/README.md`: effective runtime state and stable command patterns
- `docs/ACTIONS_LOG.md`: step-by-step operational history
- `docs/LESSONS.md`: troubleshooting playbook and anti-regression lessons
- `docs/BACKUPS.md`: backup artifacts and restore snippets
- `RELEASE_NOTES.md`: change history for this repository
- `AGENTS.md`: explicit instructions and constraints for AI agents
- `agent-manifest.json`: machine-readable capability/profile metadata
- `llms.txt`: compact index for LLM retrieval workflows

## Security and Privacy

- No API keys, tokens, passwords, or raw credentials are stored.
- Absolute local paths are normalized to `$HOME` where possible.
- This repository contains operational metadata, not secrets.

## Limitations

- This repo does not include executable automation scripts yet.
- Environment-specific details may require adaptation on other machines.
- Upstream model behavior can change; keep re-validating critical paths.

## Contributing

Open an issue or PR with:

1. Repro steps
2. Expected vs actual result
3. Log excerpts (sanitized)
4. Proposed fix and verification command
