#!/bin/bash
killall -p conky
# sleep 1

# 添加错误检查和输出
if ! command -v conky &> /dev/null; then
    echo "错误：找不到 conky 命令，请确保已安装 conky"
    exit 1
fi

# 检查配置文件是否存在
for conf in system.conf network.conf calendar.conf; do
    if [ ! -f "$HOME/.config/conky/$conf" ]; then
        echo "错误：找不到配置文件 $HOME/.config/conky/$conf"
        exit 1
    fi
done

# 启动 conky 并输出详细信息
conky -c $HOME/.config/conky/system.conf 2>&1 &
conky -c $HOME/.config/conky/network.conf 2>&1 &
conky -c $HOME/.config/conky/calendar.conf 2>&1 &