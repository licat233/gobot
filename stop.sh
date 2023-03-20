#!/bin/bash
cd "$(dirname "$0")"

chmod a+x ./*.sh

name=$1

if [ "$name" == "all" ]; then
if ps ax | grep -v grep | grep "go-cqhttp" > /dev/null;then
    pid=$(ps ax | grep -v grep | grep "go-cqhttp" | awk '{print $1}')
    # 获取进程的 PID，用于后续的 kill 操作
    kill $pid
    echo -e "\033[32m\033[1m qq已停止 \033[0m"
fi

if ps ax | grep -v grep | grep "gpt-bot" > /dev/null;then
    pid=$(ps ax | grep -v grep | grep "gpt-bot" | awk '{print $1}')
    # 获取进程的 PID，用于后续的 kill 操作
    kill $pid
    echo -e "\033[32m\033[1m bot已停止 \033[0m"
fi

    exit 0
fi

if [ "$name" == "qq" ]; then
if ps ax | grep -v grep | grep "go-cqhttp" > /dev/null;then
    pid=$(ps ax | grep -v grep | grep "go-cqhttp" | awk '{print $1}')
    # 获取进程的 PID，用于后续的 kill 操作
    kill $pid
fi
echo -e "\033[32m\033[1m qq已停止 \033[0m"
    exit 0
fi

if [ "$name" == "bot" ];then
if ps ax | grep -v grep | grep "gpt-bot" > /dev/null;then
    pid=$(ps ax | grep -v grep | grep "gpt-bot" | awk '{print $1}')
    # 获取进程的 PID，用于后续的 kill 操作
    kill $pid
fi
echo -e "\033[32m\033[1m bot已停止 \033[0m"
    exit 0
fi

echo -e "\033[33m\033[1m请输入对应的命令：qq 或者 bot 或者 all，如: stop.sh all \033[0m"