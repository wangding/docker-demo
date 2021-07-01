#!/bin/bash

echo '查看容器，按回车键继续...' && read
docker ps

echo -e '\n停止容器，按回车键继续...' && read
docker stop abcweb

echo -e '\n删除容器，按回车键继续...' && read
docker rm abcweb

echo -e '\n查看容器，按回车键继续...' && read
docker ps

echo -e '\n查看镜像，按回车键继续...' && read
docker images

echo -e '\n删除镜像，按回车键继续...' && read
docker rmi abcweb-img:latest

echo -e '\n查看镜像，按回车键继续...' && read
docker images
