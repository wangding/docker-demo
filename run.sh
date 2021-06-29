#!/bin/bash

echo '构建镜像，按回车键继续...' && read
docker build . -t gb-docker:latest --rm=true

echo -e '\n查看镜像，按回车键继续...' && read
docker images

echo -e '\n启动容器，按回车键继续...' && read
docker run -d --name gb -p 8080:80 gb-docker:latest

echo -e '\n查看容器，按回车键继续...' && read
docker ps

echo -e '\n访问容器，按回车键继续...' && read
curl http://localhost:8080
