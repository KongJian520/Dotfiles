#!/bin/bash

SOUND_DIR="/usr/share/sounds/freedesktop/stereo"
TEMP_FILE=$(mktemp)

# 创建文件列表
find "$SOUND_DIR" -name "*.oga" -printf "%f\n" | sort > "$TEMP_FILE"

# 定义播放函数
play_sound() {
    local sound="$1"
    paplay "$SOUND_DIR/$sound" &
}
export -f play_sound
export SOUND_DIR

# 使用 yad 创建列表
selected=$(yad --list \
    --title="声音预览" \
    --width=400 \
    --height=500 \
    --column="声音文件:TEXT" \
    --listen \
    --select-action='bash -c "play_sound %s"' \
    --separator="" \
    --button="取消:1" \
    --button="确认:0" \
    --no-headers \
    $(< "$TEMP_FILE"))

# 获取返回值
ret=$?

# 如果点击确认并且有选择
if [ $ret -eq 0 ] && [ -n "$selected" ]; then
    echo "$SOUND_DIR/$selected"
fi

# 清理临时文件
rm "$TEMP_FILE"