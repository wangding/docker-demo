#!/bin/bash

echo -e '\n查看容器，按回车键继续...' && read
docker ps -a

echo -e '\n启动容器，按回车键继续...' && read
docker run -d --name jk -p 8080:8080 -p 8888:50000 -v /var/jenkins_home jenkins/jenkins:alpine

echo -e '\n查看容器，按回车键继续...' && read
docker ps -a
