#!/usr/bin/env bash
set -euo pipefail

BASHRC="$HOME/.bashrc"
INSTALL_DIR="$HOME/.local/share/kayra-terminal-banner"
START_MARKER='# >>> kayra-terminal-banner >>>'
END_MARKER='# <<< kayra-terminal-banner <<<'

if [[ -f "$BASHRC" ]]; then
    HAS_START=0
    HAS_END=0
    grep -Fqx "$START_MARKER" "$BASHRC" && HAS_START=1 || true
    grep -Fqx "$END_MARKER" "$BASHRC" && HAS_END=1 || true

    if [[ "$HAS_START" -ne "$HAS_END" ]]; then
        printf 'Error: the banner block in ~/.bashrc is incomplete. No files were changed.\n' >&2
        exit 1
    fi

    if [[ "$HAS_START" -eq 1 ]]; then
        TEMP_FILE="$(mktemp)"
        trap 'rm -f "$TEMP_FILE"' EXIT
        awk -v start="$START_MARKER" -v finish="$END_MARKER" '
            $0 == start { skip = 1; next }
            $0 == finish { skip = 0; next }
            !skip { print }
        ' "$BASHRC" > "$TEMP_FILE"
        cat "$TEMP_FILE" > "$BASHRC"
    fi
fi

rm -rf -- "$INSTALL_DIR"
printf 'Kayra Terminal Banner removed. Open a new terminal to see the normal prompt.\n'
