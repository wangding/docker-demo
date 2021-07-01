#!/bin/bash

echo -e '\n查看容器，按回车键继续...' && read
docker ps -a

echo -e '\n启动容器，按回车键继续...' && read
docker run -d \
  -e TZ="Asia/Shanghai" \
  -v /data  \
  --net host \
  --restart=always \
  --name=gogs \
  gogs/gogs:0.11.29
