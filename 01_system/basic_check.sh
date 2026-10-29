#!/bin/bash
# 系统基础巡检：CPU/内存/磁盘/负载/登录用户
set -euo pipefail

echo "===== 系统基础巡检 $(date '+%F %T') ====="
echo "主机名: $(hostname)"
echo "内核:   $(uname -r)"
echo "运行时间: $(uptime -p 2>/dev/null || uptime)"

echo -e "\n--- CPU 负载 ---"
uptime

echo -e "\n--- 内存使用 ---"
free -h

echo -e "\n--- 磁盘使用（>80% 标红提示）---"
df -hP | awk 'NR==1 || $5+0>=80 {print}'

echo -e "\n--- 占用 TOP5 进程（按内存）---"
ps aux --sort=-%mem | head -6

echo -e "\n--- 当前登录用户 ---"
who

echo -e "\n===== 巡检结束 ====="
