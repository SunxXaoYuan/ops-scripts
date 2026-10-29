#!/bin/bash
# 目录备份脚本：backup.sh <源目录> <备份目录> [保留天数]
set -euo pipefail

SRC="${1:?用法: $0 <源目录> <备份目录> [保留天数]}"
DEST="${2:?用法: $0 <源目录> <备份目录> [保留天数]}"
KEEP_DAYS="${3:-7}"

[[ -d "$SRC" ]] || { echo "源目录不存在: $SRC"; exit 1; }
mkdir -p "$DEST"

STAMP=$(date '+%Y%m%d_%H%M%S')
NAME=$(basename "$SRC")
ARCHIVE="$DEST/${NAME}_${STAMP}.tar.gz"

tar -czf "$ARCHIVE" -C "$(dirname "$SRC")" "$NAME"
echo "备份完成: $ARCHIVE ($(du -h "$ARCHIVE" | cut -f1))"

# 清理过期备份
find "$DEST" -name "${NAME}_*.tar.gz" -mtime +"$KEEP_DAYS" -delete
echo "已清理 ${KEEP_DAYS} 天前的旧备份"
