#!/bin/bash
# 日志清理：clean_logs.sh <日志目录> [保留天数]
set -euo pipefail

LOGDIR="${1:?用法: $0 <日志目录> [保留天数]}"
KEEP_DAYS="${2:-7}"

[[ -d "$LOGDIR" ]] || { echo "目录不存在: $LOGDIR"; exit 1; }

echo "清理 $LOGDIR 下 ${KEEP_DAYS} 天前的 .log 文件..."
find "$LOGDIR" -type f -name "*.log" -mtime +"$KEEP_DAYS" -print -delete

echo -e "\n当前目录日志文件大小 TOP10："
find "$LOGDIR" -type f -name "*.log" -exec du -h {} + 2>/dev/null | sort -rh | head -10
