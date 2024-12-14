#!/bin/bash

# 检测 DP-2 的连接状态
if xrandr | grep -q "^DP-2 connected"; then
    xrandr --output DP-2 --mode 1920x1080 --rate 165 --primary
else
    # 如果 DP-2 未连接，禁用显示器
    xrandr --output DP-2 --off
fi