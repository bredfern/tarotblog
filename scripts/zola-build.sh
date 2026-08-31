#!/usr/bin/env bash
# Netlify's automatic Zola installer (triggered by ZOLA_VERSION) does not
# reliably put the `zola` binary on PATH, so fetch it explicitly here.
set -euo pipefail

ZOLA_VERSION="${ZOLA_VERSION:-0.23.4}"
BIN_DIR="$HOME/.local/zola-bin"
ZOLA_BIN="$BIN_DIR/zola"

if [ ! -x "$ZOLA_BIN" ]; then
  mkdir -p "$BIN_DIR"
  curl -sL "https://github.com/getzola/zola/releases/download/v${ZOLA_VERSION}/zola-v${ZOLA_VERSION}-x86_64-unknown-linux-gnu.tar.gz" \
    | tar xz -C "$BIN_DIR" zola
fi

"$ZOLA_BIN" build "$@"
