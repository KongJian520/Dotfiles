#!/bin/bash

# 终止已经运行的polybar实例
killall -q polybar

# 等待进程被终止
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# 在每个显示器上启动polybar
for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload top &
    MONITOR=$m polybar --reload bottom &
done