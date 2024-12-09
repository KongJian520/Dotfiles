#!/bin/bash

# 定义锁文件路径
LOCKFILE="/tmp/power_monitor.lock"

# 检查锁文件
if [ -f "$LOCKFILE" ]; then
    pid=$(cat "$LOCKFILE")
    if ps -p "$pid" > /dev/null 2>&1; then
        exit 0  # 静默退出，因为是开机自动运行
    else
        rm -f "$LOCKFILE"
    fi
fi

# 创建锁文件
echo $$ > "$LOCKFILE"

# 定义音频文件路径
PLUG_SOUND="/usr/share/sounds/freedesktop/stereo/power-plug.oga"
UNPLUG_SOUND="/usr/share/sounds/freedesktop/stereo/power-unplug.oga"

# 清理函数
cleanup() {
    echo "正在关闭电源监控..."
    rm -f "$LOCKFILE"
    dunstify "电源监控" "监控服务已停止"
    exit 0
}

# 注册信号处理
trap cleanup SIGINT SIGTERM

# 获取之前的电源状态
previous_state=$(cat /sys/class/power_supply/ADP0/online)

while true; do
    # 获取当前电源状态
    current_state=$(cat /sys/class/power_supply/ADP0/online)
    
    # 如果状态发生改变
    if [ "$current_state" != "$previous_state" ]; then
        if [ "$current_state" = "1" ]; then
            # 电源接入提示
            dunstify "电源状态" "电源已接入" -i battery-full-charging
            paplay "$PLUG_SOUND"
        else
            # 电源拔出提示
            dunstify "电源状态" "电源已拔出" -i battery-caution
            paplay "$UNPLUG_SOUND"
        fi
        
        # 更新状态
        previous_state=$current_state
    fi
    
    # 休眠1秒后继续检查
    sleep 1
done