#!/bin/bash
cd "$(dirname "$0")"

chmod a+x ./*.sh

if [ ! -d "./bot" ]; then
    mkdir bot
fi

cd bot

if [ ! -f "gpt-bot" ]; then

URL="https://github.com/rust-kotlin/gpt-bot/releases/download/v2.0.0/gpt-bot-amd64-linux"

if ! wget -O "gpt-bot" $URL; then
echo -e "\033[31m下载失败：$URL\033[0m"
exit 1
fi

# find ./ -type f ! -name 'gpt-bot' -delete

fi

chmod a+x ./gpt-bot

#配置bot
if [ ! -f "config.json" ]; then
echo -e "\033[32m\033[1m会在bot目录下生成 config.json 文件，请按 ctrl + c 退出程序\033[0m"
  ./gpt-bot
  echo -e "\033[33m\033[1m提示：请在 ./bot/config.json 内填写配置，再运行当前脚本！ \033[0m"
  exit 1;
fi

# 已运行则kill
if ps ax | grep -v grep | grep "gpt-bot" > /dev/null;then
    pid=$(ps ax | grep -v grep | grep "gpt-bot" | awk '{print $1}')
    # 获取进程的 PID，用于后续的 kill 操作
    kill $pid
fi

nohup ./gpt-bot &

echo -e "\033[32m\033[1m bot运行成功 \033[0m"