#!/usr/bin/env python3
import requests
import time
import subprocess
import logging
from urllib.parse import urlparse
import socket

# 设置日志
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

def send_notification(message):
    """发送系统通知"""
    try:
        subprocess.run(['notify-send', '门户检测脚本', message], check=True)
    except subprocess.CalledProcessError as e:
        logger.error(f"发送通知失败: {str(e)}")

def check_internet_connection():
    """
    检查互联网连接状态
    返回True表示可以正常访问，False表示可能需要门户认证
    """
    test_url = "https://www.baidu.com"
    try:
        response = requests.get(test_url, timeout=5, allow_redirects=False)
        
        # 检查是否被重定向到其他域名（可能是门户登录页面）
        if response.status_code in [301, 302]:
            redirect_url = response.headers.get('Location', '')
            original_domain = urlparse(test_url).netloc
            redirect_domain = urlparse(redirect_url).netloc
            
            if original_domain != redirect_domain:
                logger.info(f"检测到重定向到其他域名: {redirect_domain}")
                return False
                
        return response.status_code == 200
    
    except (requests.RequestException, socket.error) as e:
        logger.error(f"网络连接错误: {str(e)}")
        return False

def get_current_wifi_ssid():
    """获取当前连接的WiFi SSID"""
    try:
        result = subprocess.run(['iwgetid', '-r'], capture_output=True, text=True)
        return result.stdout.strip()
    except subprocess.CalledProcessError:
        return None

def main():
    check_interval = 300  # 5分钟检查一次
    last_ssid = None
    
    while True:
        current_ssid = get_current_wifi_ssid()
        
        # 如果WiFi发生变化或者是首次运行
        if current_ssid != last_ssid:
            logger.info(f"WiFi网络变更: {current_ssid}")
            if check_internet_connection():
                send_notification(f"已成功连接到网络: {current_ssid}")
            else:
                send_notification(f"新连接到 {current_ssid} - 可能需要门户登录")
            last_ssid = current_ssid
        
        # 定期检查互联网连接
        elif not check_internet_connection():
            send_notification(f"当前网络 {current_ssid} 可能需要门户登录")
        
        time.sleep(check_interval)

if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        logger.info("程序已终止")
        