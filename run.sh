#!/bin/bash

echo '拉取镜像，按回车键继续...' && read
docker pull mysql

echo -e '\n查看镜像，按回车键继续...' && read
docker images

echo -e '\n启动容器，按回车键继续...' && read
mkdir mysql
docker run -d \
  --name ms \
  -e MYSQL_ROOT_PASSWORD=ddd \
  -v ~/rep/docker-demo/db:/docker-entrypoint-initdb.d \
  -v ~/rep/docker-demo/mysql:/var/lib/mysql \
  mysql:latest

echo -e '\n查看容器，按回车键继续...' && read
docker ps

echo -e "\nMySQL 容器的 IP 地址：$(docker inspect -f '{{.NetworkSettings.IPAddress}}' ms)"
