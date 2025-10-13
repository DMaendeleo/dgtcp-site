#!/usr/bin/env bash
set -euo pipefail

OS=$(uname -s)
if [[ "$OS" == "Darwin" ]]; then
  PGDATA_PATH="${PGDATA_PATH:-$HOME/docker/postgres/db}"
else
  PGDATA_PATH="${PGDATA_PATH:-/srv/postgres/payloaddb}"
fi

mkdir -p "$PGDATA_PATH"
sudo chown -R 999:999 "$PGDATA_PATH"
chmod 700 "$PGDATA_PATH"

export PGDATA_PATH
#docker compose up -d --build
