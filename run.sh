#!/bin/bash

echo '构建镜像，按回车键继续...' && read
docker build . -t ap-docker:latest --rm=true

echo -e '\n查看镜像，按回车键继续...' && read
docker images

echo -e '\n启动容器，查看时区，按回车键继续...' && read
docker run -it --name ap ap-docker:latest date
