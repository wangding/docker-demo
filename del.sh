#!/bin/bash

echo '查看容器，按回车键继续...' && read
docker ps

echo -e '\n停止容器，按回车键继续...' && read
docker stop ms

echo -e '\n删除容器，按回车键继续...' && read
sudo rm -rf mysql
docker rm ms

echo -e '\n查看容器，按回车键继续...' && read
docker ps
