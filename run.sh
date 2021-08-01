#!/bin/bash

echo -e '\n查看容器，按回车键继续...' && read
docker ps -a

echo -e '\n启动容器，按回车键继续...' && read
docker run -d \
  -p 443:443 -p 8080:80 \
  --name gitlab \
  --restart always \
  -v /etc/gitlab \
  -v /var/log/gitlab \
  -v /var/opt/gitlab \
  gitlab/gitlab-ee:latest

echo -e '\n查看容器，按回车键继续...' && read
docker ps -a
