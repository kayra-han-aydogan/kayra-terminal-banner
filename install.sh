#!/usr/bin/env bash
set -euo pipefail

SOURCE_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
INSTALL_DIR="$HOME/.local/share/kayra-terminal-banner"
BASHRC="$HOME/.bashrc"
START_MARKER='# >>> kayra-terminal-banner >>>'
END_MARKER='# <<< kayra-terminal-banner <<<'

if [[ ! -f "$SOURCE_DIR/banner.sh" ]]; then
    printf 'Error: banner.sh was not found in %s\n' "$SOURCE_DIR" >&2
    exit 1
fi

mkdir -p "$INSTALL_DIR"
install -m 755 "$SOURCE_DIR/banner.sh" "$INSTALL_DIR/banner.sh"
touch "$BASHRC"

if ! grep -Fqx "$START_MARKER" "$BASHRC"; then
    cat >> "$BASHRC" <<'BLOCK'

# >>> kayra-terminal-banner >>>
if [[ $- == *i* && -f "$HOME/.local/share/kayra-terminal-banner/banner.sh" ]]; then
    source "$HOME/.local/share/kayra-terminal-banner/banner.sh"
fi
# <<< kayra-terminal-banner <<<
BLOCK
fi

printf 'Kayra Terminal Banner installed. Open a new terminal or run: source ~/.bashrc\n'
