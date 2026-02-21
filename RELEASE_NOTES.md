# Release Notes

## v1.4.0 - 2026-02-21

### Added

- `cc-provider` MiniMax profile commands:
  - `cc-provider minimax`
  - `cc-provider mini`
- New alias scripts:
  - `scripts/cc-mini`
  - `scripts/cc-minimax`
- Provider-specific secret stash support:
  - `kimi-secrets.json`
  - `minimax-secrets.json`

### Changed

- Switch flow now supports `Kimi <-> Claude <-> MiniMax`.
- Docs and agent metadata updated for MiniMax-capable switching.

## v1.3.0 - 2026-02-21

### Added

- Provider switch automation scripts:
  - `scripts/cc-provider`
  - `scripts/cc-kimi`
  - `scripts/cc-claude`
- New guide: `docs/PROFILE_SWITCHING.md`
- README and docs updates for one-command `Kimi <-> Claude` switching.

### Changed

- `agent-manifest.json` upgraded to `1.3.0` with utility metadata.
- `llms.txt` index expanded with profile switching documentation.
- `docs/README.md` now documents backup behavior and auth-conflict-safe switching.

### Notes

- No credentials or secrets are stored in this repository.
- Runtime backups are created locally under `$HOME/.claude/backups/provider-switch-*`.
- Next planned feature: `MiniMax 2.5` profile addition to `cc-provider`.

## v1.2.0 - 2026-02-21

### Added

- Synced latest sanitized `kimi-ops` docs:
  - `docs/README.md`
  - `docs/ACTIONS_LOG.md`
  - `docs/LESSONS.md`
  - `docs/BACKUPS.md`
  - `docs/SWARM_OPTIMIZATION.md` (new)
- Documented commandless autonomous orchestration mode in repository content.
- Updated top-level `README.md` repo map and outcomes.

### Notes

- No credentials or tokens added.
- Paths remain normalized with `$HOME` placeholder.

## v1.1.0 - 2026-02-21

### Added

- Expanded top-level `README.md` with:
  - purpose
  - verified outcomes
  - quick start
  - limitations
  - repo map
- `AGENTS.md` for AI-agent execution guidance.
- `agent-manifest.json` for machine-readable repository capabilities.
- `llms.txt` for lightweight LLM indexing/retrieval.
- `RELEASE_NOTES.md` (this file).

### Notes

- Existing docs in `docs/` remain the source operational record:
  - `docs/README.md`
  - `docs/ACTIONS_LOG.md`
  - `docs/LESSONS.md`
  - `docs/BACKUPS.md`

## v1.0.0 - 2026-02-21

### Initial Public Baseline

- Created repository with sanitized Kimi + Claude Code optimization docs.
- Included operational timeline, backup notes, and troubleshooting lessons.
