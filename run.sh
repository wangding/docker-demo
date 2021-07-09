#!/bin/bash

echo -e '\n运行构建好的镜像，按回车键继续...' && read
docker run --rm wdamtb/ci-app:latest
