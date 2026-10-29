# 🛠️ Linux Ops Scripts Toolkit

这是一个用于存放日常 Linux 系统运维、自动化管理的 Shell 脚本仓库。

## 📖 脚本分类目录

| 分类目录 | 核心功能描述 | 包含的典型脚本示例 |
| :--- | :--- | :--- |
| 📁 [01_system](./01_system) | **系统管理与巡检**：服务器初始化、资源检查、故障排错 | `basic_check.sh` |
| 📁 [02_automation](./02_automation) | **自动化与定时任务**：一键部署、定时备份、crontab 配合 | `backup.sh` |
| 📁 [03_logs](./03_logs) | **日志与文件处理**：日志清理、错误筛选、批量文本处理 | `clean_logs.sh` |
| 📁 [04_network](./04_network) | **网络与服务监控**：端口检测、网站存活监控 | `check_port.sh` |

## 🚀 使用方法

1. 克隆仓库到本地：
   `git clone https://github.com/SunxXaoYuan/ops-scripts.git`
2. 进入对应目录，赋予执行权限：
   `chmod +x *.sh`
3. 运行脚本：`./脚本名称.sh`

## 🛡️ 免责声明
本仓库脚本仅供学习与参考。在生产环境使用前，请务必在测试环境验证。
