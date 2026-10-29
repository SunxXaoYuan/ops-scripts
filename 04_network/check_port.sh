#!/bin/bash
# 端口/网站存活检测：check_port.sh <host> <port>
set -euo pipefail

HOST="${1:?用法: $0 <host> <port>}"
PORT="${2:?用法: $0 <host> <port>}"

if timeout 3 bash -c "</dev/tcp/$HOST/$PORT" 2>/dev/null; then
    echo "[OK]   $HOST:$PORT 可连通"
    exit 0
else
    echo "[FAIL] $HOST:$PORT 不可达"
    exit 1
fi
