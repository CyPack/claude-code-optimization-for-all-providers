# Claude Code Optimization for All Providers

<p align="center">
  <strong>Human + Agent Friendly Provider Switching for Claude Code</strong><br/>
  Kimi • Claude • MiniMax • Ollama-aware workflows with credential-safe setup.
</p>

<table align="center">
  <tr>
    <td align="center" width="120">
      <img src="assets/logos/claude-code.svg" alt="Claude Logo" width="44" height="44" />
    </td>
    <td align="center" width="140">
      <img src="assets/logos/kimi.svg" alt="Kimi Logo" width="92" height="31" />
    </td>
    <td align="center" width="120">
      <img src="assets/logos/minimax.svg" alt="MiniMax Logo" width="44" height="44" />
    </td>
    <td align="center" width="120">
      <img src="assets/logos/ollama.svg" alt="Ollama Logo" width="44" height="44" />
    </td>
  </tr>
  <tr>
    <td align="center"><sub><strong>Claude</strong></sub></td>
    <td align="center"><sub><strong>Kimi</strong></sub></td>
    <td align="center"><sub><strong>MiniMax</strong></sub></td>
    <td align="center"><sub><strong>Ollama</strong></sub></td>
  </tr>
</table>

<p align="center">
  <a href="https://github.com/CyPack/claude-code-optimization-for-all-providers/blob/main/docs/INSTALLATION.md">Install Guide</a>
  ·
  <a href="https://github.com/CyPack/claude-code-optimization-for-all-providers/blob/main/docs/PROFILE_SWITCHING.md">Switch Guide</a>
  ·
  <a href="https://github.com/CyPack/claude-code-optimization-for-all-providers/blob/main/AGENTS.md">Agent Rules</a>
</p>

## Why This Repo

- Gives you one-command provider switching for Claude Code.
- Keeps setup credential-safe and backup-first.
- Works for both humans and autonomous agents.
- Documents real failure modes and tested mitigations.

## Quick Install

Local clone install:

```bash
bash scripts/install-switch.sh
```

One-command remote install:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/CyPack/claude-code-optimization-for-all-providers/main/scripts/install-from-github.sh)"
```

## Quick Use

```bash
cc-provider status
cc-provider kimi
cc-provider claude
cc-provider minimax
```

MiniMax first-time setup (official Claude Code flow):

```bash
export ANTHROPIC_AUTH_TOKEN="your_minimax_api_key"
export ANTHROPIC_BASE_URL="https://api.minimax.io/anthropic"
cc-provider minimax
cc-provider status
```

Alias commands:

```bash
cc-kimi
cc-claude
cc-mini
cc-minimax
```

## Human-Friendly Behavior

- If you are already on target profile, it prints a no-op notice.
  - Example: `CC zaten su an kimi kullaniyor.`
- On real switch, it prints transition summary:
  - previous provider/API
  - current provider/API
- Every switch creates rollback backup under:
  - `$HOME/.claude/backups/provider-switch-YYYYmmdd-HHMMSS-XXXXXX/`

## Agent-Friendly Contract

Agents should follow this protocol:

1. Run `cc-provider <kimi|claude|minimax>`.
2. Run `cc-provider status`.
3. Return profile, model, ToolSearch state, and transition summary.
4. If API/auth token warning appears, report warning without inventing credentials.

## Repository Map

- `docs/INSTALLATION.md`: install/uninstall and external CLI setup
- `docs/PROFILE_SWITCHING.md`: safe switch behavior and notifications
- `docs/README.md`: operational state snapshot
- `docs/LESSONS.md`: troubleshooting patterns
- `docs/ACTIONS_LOG.md`: chronological change evidence
- `docs/BACKUPS.md`: backup and restore references
- `docs/SWARM_OPTIMIZATION.md`: Kimi-specific orchestration notes
- `scripts/cc-provider`: main switch utility
- `scripts/install-switch.sh`: local installer
- `scripts/install-from-github.sh`: remote one-command installer
- `AGENTS.md`: explicit agent behavior guidance
- `agent-manifest.json`: machine-readable capabilities
- `llms.txt`: compact retrieval index

## Security

- No API keys or raw credentials are stored in this repository.
- Scripts only manage local `~/.claude` config and profile stash files.
- Provider secrets are kept in local profile files (not committed):
  - `~/.claude/profiles/kimi-secrets.json`
  - `~/.claude/profiles/minimax-secrets.json`

## Compatibility Notes

- Kimi profile defaults to ToolSearch disabled for known compatibility reasons.
- MiniMax profile keeps ToolSearch enabled by default.
- MiniMax profile defaults to `MiniMax-M2.5` and `https://api.minimax.io/anthropic`.
- Claude profile removes active API-key/auth-token routing vars to reduce auth conflicts.
