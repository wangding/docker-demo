#!/bin/bash

echo '查看容器，按回车键继续...' && read
docker ps

echo -e '\n停止容器，按回车键继续...' && read
docker stop gitlab

echo -e '\n删除容器，按回车键继续...' && read
docker rm gitlab

echo -e '\n查看容器，按回车键继续...' && read
docker ps

echo -e '\n查看镜像，按回车键继续...' && read
docker images

echo -e '\n删除镜像，按回车键继续...' && read
docker rmi -v gitlab/gitlab-ce:latest

echo -e '\n查看镜像，按回车键继续...' && read
docker images
