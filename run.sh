#!/bin/bash

echo '构建镜像，按回车键继续...' && read
docker build . -t node-docker:latest --rm=true

echo -e '\n查看镜像，按回车键继续...' && read
docker images

echo -e '\n启动容器，按回车键继续...' && read
docker run -d --name nd -p 8080:8080 node-docker:latest

echo -e '\n查看容器，按回车键继续...' && read
docker ps

echo -e '\n访问容器，按回车键继续...' && read
curl http://localhost:8080
