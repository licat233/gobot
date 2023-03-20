#!/bin/bash
cd "$(dirname "$0")"

chmod a+x ./*.sh

if [ ! -d "./qq" ]; then
    mkdir qq
fi

cd qq

if [ ! -f "go-cqhttp" ]; then

URL=https://github.com/Mrs4s/go-cqhttp/releases/download/v1.0.0-rc5/go-cqhttp_linux_amd64.tar.gz

if ! wget -O "qq.tar.gz" $URL; then
echo -e "\033[31m下载失败：$URL\033[0m"
exit 1
fi

if [ ! -f "qq.tar.gz" ];then
echo -e "\033[31m下载失败：$URL\033[0m"
exit 1
fi

tar -zxvf qq.tar.gz

# find ./ -type f ! -name 'go-cqhttp' ! -name 'config.yml' ! -name 'isLogin' -delete

fi

chmod a+x ./go-cqhttp

# 配置qq
if [ ! -f "config.yml" ]; then
  echo -e "\033[32m\033[1m提示：一般来说，选择【2: 正向 Websocket 通信】即可，默认配置文件已生成，然后按 enter 键\033[0m"
  ./go-cqhttp
  echo -e "\033[33m\033[1m提示：请在./qq/config.yml 内填写配置，再运行当前脚本！ \033[0m"
  exit 1;
fi

# 登录qq
if [ ! -f "isLogin" ]; then
echo -e "\033[32m\033[1m根据提示完成登录，在登录成功后按 ctrl + c 退出程序\033[0m"
touch ./isLogin
./go-cqhttp
fi

# 已运行则kill
if ps ax | grep -v grep | grep "go-cqhttp" > /dev/null;then
    pid=$(ps ax | grep -v grep | grep "go-cqhttp" | awk '{print $1}')
    # 获取进程的 PID，用于后续的 kill 操作
    kill $pid
fi

nohup ./go-cqhttp &

echo -e "\033[32m\033[1m qq运行成功 \033[0m"
