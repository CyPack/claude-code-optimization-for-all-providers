# Source Registry

Last verified: 2026-02-21

This registry is the update baseline for this repository.  
When provider behavior changes, start from these links before modifying scripts/docs.

## Provider Sources (Official)

| Provider | Source | URL | Purpose | Check cadence |
|---|---|---|---|---|
| Claude Code | Claude Code settings docs | https://docs.anthropic.com/en/docs/claude-code/settings | Canonical env/settings references and behavior constraints | Monthly |
| MiniMax | Claude Code integration docs | https://platform.minimax.io/docs/coding-plan/claude-code | MiniMax-specific Claude Code env/model requirements | Monthly |
| MiniMax | API key page | https://platform.minimax.io/user-center/basic-information/interface-key | Where users create/revoke MiniMax keys | Monthly |
| MiniMax | Coding plan page | https://platform.minimax.io/user-center/payment/coding-plan?cycle_type=1 | Subscription/plan route used in onboarding docs | Monthly |
| Kimi | Code console | https://www.kimi.com/code/console | Primary Kimi coding entrypoint | Monthly |
| Kimi | Pricing page | https://www.kimi.com/membership/pricing | Plan and billing route used in onboarding docs | Monthly |
| Ollama | Anthropic compatibility docs | https://docs.ollama.com/openai#anthropic-compatibility | Official `ANTHROPIC_BASE_URL` + `ANTHROPIC_AUTH_TOKEN` method | Monthly |
| Ollama | Claude Code integration docs | https://docs.ollama.com/integrations/claude-code | Official Claude Code + Ollama path (manual + launch flow) | Monthly |
| Ollama | Claude Code launch announcement | https://ollama.com/blog/claude-code | Change signal for model recommendations and rollout details | Monthly |
| Git | `git worktree` docs | https://git-scm.com/docs/git-worktree | Canonical multi-worktree behavior reference | Quarterly |

## Supporting Repositories

| Project | URL | Type | Why tracked |
|---|---|---|---|
| Ollama core | https://github.com/ollama/ollama | Official | Upstream issues/releases impacting local Claude Code routing |

## Update Protocol

1. Re-check all official URLs above.
2. If required env/model/base URL changed, update:
   - `scripts/cc-provider`
   - `README.md`
   - `docs/PROFILE_SWITCHING.md`
   - `docs/INSTALLATION.md`
3. Record change in:
   - `docs/LESSONS.md` (new failure mode or migration)
   - `docs/ACTIONS_LOG.md` (chronological evidence)
   - `RELEASE_NOTES.md` (versioned summary)
4. Run verification:
   - `bash -n scripts/cc-provider`
   - `cc-provider status`
   - relevant provider smoke test
