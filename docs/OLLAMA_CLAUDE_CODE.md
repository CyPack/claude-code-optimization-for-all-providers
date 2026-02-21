# Ollama + Claude Code Guide

Last verified: 2026-02-21

This guide documents the repository-supported Ollama path for Claude Code using Ollama's Anthropic-compatible endpoint.

## Official Integration Paths

Path 1 (official launcher):

```bash
ollama launch claude
```

Path 2 (manual env):

```bash
export ANTHROPIC_BASE_URL=http://localhost:11434/anthropic
export ANTHROPIC_AUTH_TOKEN=ollama
export ANTHROPIC_MODEL=qwen3-coder
claude
```

## Repository Switch Path

This repository supports one-command Ollama switching:

```bash
cc-provider ollama
cc-provider status
```

Default values applied by `cc-provider ollama`:

- `ANTHROPIC_BASE_URL=http://localhost:11434/anthropic`
- `ANTHROPIC_AUTH_TOKEN=ollama`
- `OLLAMA_MODEL` default: `qwen3-coder`
- `API_TIMEOUT_MS=3000000`
- `CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=1`

Override defaults when needed:

```bash
OLLAMA_MODEL=llama3.2 cc-provider ollama
OLLAMA_BASE_URL_DEFAULT=http://127.0.0.1:11434/anthropic cc-provider ollama
```

## Pre-Flight Checklist

```bash
ollama --version
ollama ps
ollama pull qwen3-coder
cc-provider ollama
cc-provider status
```

## Troubleshooting

Connection refused:

- Ensure Ollama daemon is running (`ollama serve` or platform service start).
- Verify URL in `~/.claude/settings.local.json` is `http://localhost:11434/anthropic`.

Model not found:

- Pull model explicitly: `ollama pull qwen3-coder`
- Re-run with explicit model: `OLLAMA_MODEL=<model_name> cc-provider ollama`

Auth conflict warning (`AUTH_TOKEN` + `API_KEY`):

- This repo removes `ANTHROPIC_API_KEY` when switching to Ollama.
- If warning still appears in current shell session, run:
  - `unset ANTHROPIC_API_KEY`

## References

- Ollama Anthropic compatibility:
  - https://docs.ollama.com/openai#anthropic-compatibility
- Ollama Claude Code integration:
  - https://docs.ollama.com/integrations/claude-code
- Ollama announcement:
  - https://ollama.com/blog/claude-code
- Ollama upstream repository:
  - https://github.com/ollama/ollama
