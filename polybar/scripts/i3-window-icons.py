#!/usr/bin/env python3
import i3ipc
import subprocess
import logging

# 设置日志
logging.basicConfig(
    level=logging.DEBUG,
    format='%(asctime)s - %(levelname)s - %(message)s',
    filename='/tmp/i3-window-debug.log'
)

# 定义应用程序和对应图标的映射
ICON_MAP = {
    'firefox': ' ',              # Firefox 浏览器
    'google-chrome': ' ',              # Chrome 浏览器
    'code': ' ',                # VS Code
    'cursor': ' ',                # Cursor
    'pycharm': ' ',            # PyCharm
    'wps': '󰏆 ',                # WPS Office
    'gedit': '󰂮 ',              # Gedit
    'dolphin': '󱢴 ',            # 文件管理器
    'ark': '󰿺 ',                # 压缩工具
    'alacritty': ' ',          # Alacritty 终端
    'kitty': ' ',              # Kitty 终端
    'mpv': ' ',                # 视频播放器
    'feh': '  ',                # 图片查看器
    'wechat': ' ',             # 微信
    'wireshark': '󱙳 ',          # Wireshark
    'default': ''             # 默认图标
}

def get_window_info(window):
    if window is None:
        return "default", ICON_MAP['default']
    
    # 获取窗口的所有可能标识符
    window_class = window.window_class.lower() if window.window_class else ''
    window_instance = window.window_instance.lower() if window.window_instance else ''
    
    logging.debug(f"Window class: {window_class}, instance: {window_instance}")
    
    # 检查类名和实例名
    if window_class in ICON_MAP:
        return window_class, ICON_MAP[window_class]
    elif window_instance in ICON_MAP:
        return window_instance, ICON_MAP[window_instance]
    
    return "default", ICON_MAP['default']

def get_workspace_windows_icons(workspace):
    """获取工作区所有窗口的图标"""
    icons = []  # 改用列表来保持窗口顺序
    
    if workspace:
        # 获取工作区内所有窗口
        for leaf in workspace.leaves():
            _, icon = get_window_info(leaf)
            icons.append(icon)
    
    # 如果没有窗口，返回默认图标
    if not icons:
        return ICON_MAP['default']
    
    # 直接返回所有图标，不去重
    return ' '.join(icons)

def update_workspace_name(i3, workspace, icons):
    try:
        # 获取工作区号
        ws_num = workspace.num
        # 构建新的工作区名称
        new_name = f"{ws_num} {icons}"
        
        logging.debug(f"Renaming workspace to: {new_name}")
        
        # 使用 i3-msg 重命名工作区
        cmd = ['i3-msg', f'rename workspace "{workspace.name}" to "{new_name}"']
        subprocess.run(cmd, check=True)
        
    except Exception as e:
        logging.error(f"Error updating workspace name: {e}")

def on_window_focus(i3, e):
    try:
        focused = i3.get_tree().find_focused()
        workspace = focused.workspace() if focused else None
        
        if workspace:
            # 获取工作区所有窗口的图标
            icons = get_workspace_windows_icons(workspace)
            logging.debug(f"Workspace icons: {icons}")
            
            # 更新工作区名称
            update_workspace_name(i3, workspace, icons)
            
    except Exception as e:
        logging.error(f"Error in on_window_focus: {e}")

def main():
    try:
        i3 = i3ipc.Connection()
        logging.info("Starting i3-window-icons script")
        
        # 监听更多窗口事件
        i3.on('window::focus', on_window_focus)
        i3.on('window::new', on_window_focus)
        i3.on('window::close', on_window_focus)
        i3.on('window::move', on_window_focus)
        i3.on('workspace::focus', on_window_focus)
        
        # 立即更新当前窗口的图标
        on_window_focus(i3, None)
        
        # 开始事件循环
        i3.main()
    except Exception as e:
        logging.error(f"Error in main: {e}")

if __name__ == '__main__':
    main()