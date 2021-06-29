#!/bin/bash

echo '查看容器，按回车键继续...' && read
docker ps -a

echo -e '\n删除容器，按回车键继续...' && read
docker rm ap

echo -e '\n查看容器，按回车键继续...' && read
docker ps -a

echo -e '\n查看镜像，按回车键继续...' && read
docker images

echo -e '\n删除镜像，按回车键继续...' && read
docker rmi ap-docker:latest

echo -e '\n查看镜像，按回车键继续...'
read
docker images
