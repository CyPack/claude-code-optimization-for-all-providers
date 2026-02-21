#!/usr/bin/env bash
set -euo pipefail

INSTALL_DIR="${INSTALL_DIR:-$HOME/.local/bin}"
SCRIPT_DIR="$(cd -- "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TIMESTAMP="$(date +%Y%m%d-%H%M%S)"

FILES=(
  "cc-provider"
  "cc-kimi"
  "cc-claude"
  "cc-mini"
  "cc-minimax"
  "cc-ollama"
)

mkdir -p "$INSTALL_DIR"

for file in "${FILES[@]}"; do
  src="$SCRIPT_DIR/$file"
  dst="$INSTALL_DIR/$file"

  if [[ ! -f "$src" ]]; then
    echo "Missing source script: $src" >&2
    exit 1
  fi

  if [[ -f "$dst" ]]; then
    cp -a "$dst" "${dst}.bak.${TIMESTAMP}"
  fi

  install -m 755 "$src" "$dst"
done

cat <<MSG
Switch scripts installed.
- Install dir: $INSTALL_DIR
- Commands: cc-provider, cc-kimi, cc-claude, cc-mini, cc-minimax, cc-ollama
MSG

if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
  cat <<WARN
PATH warning:
- $INSTALL_DIR is not in current PATH.
- Add this line to your shell rc file (~/.bashrc or ~/.zshrc):
  export PATH="$INSTALL_DIR:\$PATH"
WARN
fi

"$INSTALL_DIR/cc-provider" status || true
