#!/bin/bash

echo -e '\n查看容器，按回车键继续...' && read
docker ps

echo -e '\n启动容器，按回车键继续...' && read
docker-compose up -d

echo -e '\n查看容器，按回车键继续...' && read
docker ps
