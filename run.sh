#!/bin/bash
cd "$(dirname "$0")"

chmod a+x ./*.sh

name=$1

if [ "$name" == "qq" ]; then
    if ! ./qq.sh; then
        exit 1
    fi
    exit 0
fi

if [ "$name" == "bot" ]; then
    if ! ./bot.sh; then
        exit 1
    fi
    exit 0
fi

echo -e "\033[33m\033[1m请输入对应的命令：qq 或者 bot，如: run.sh qq \033[0m"
