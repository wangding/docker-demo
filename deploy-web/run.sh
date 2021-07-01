#!/bin/bash

echo '构建镜像，按回车键继续...' && read
docker build . -t deploy-img:latest --rm=true

echo -e '\n查看镜像，按回车键继续...' && read
docker images

echo -e '\n启动容器，按回车键继续...' && read
docker run -d \
  --name=deploy --privileged \
  -v /var/run/docker.sock:/var/run/docker.sock \
  --user root \
  -p 9999:8080 \
  deploy-img:latest

echo -e '\n查看容器，按回车键继续...' && read
docker ps
