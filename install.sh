#!/usr/bin/env bash
set -euo pipefail

BASE_URL="${LINUX_SETUP_BASE_URL:-https://setup.lost.plus}"
BIN_DIR="$HOME/.local/bin"
TARGET="$BIN_DIR/linux-setup"

mkdir -p "$BIN_DIR"

tmp=$(mktemp)
trap 'rm -f "$tmp"' EXIT

curl -fsSL "$BASE_URL/bin/linux-setup" -o "$tmp"
install -m 0755 "$tmp" "$TARGET"

echo "Installed $TARGET"
echo "Run: linux-setup install resume ai-menu"

if (($# > 0)); then
    "$TARGET" "$@"
fi
