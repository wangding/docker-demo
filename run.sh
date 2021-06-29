#!/bin/bash

echo '构建镜像，按回车键继续...' && read
docker build . -t todo-docker:latest --rm=true

echo -e '\n查看镜像，按回车键继续...' && read
docker images

echo -e '\n启动容器，按回车键继续...' && read
docker run -d --name todo -p 8080:8080 todo-docker:latest

echo -e '\n查看容器，按回车键继续...' && read
docker ps
