FROM alpine

# 更新 Alpine 的软件源为国内源，提高下载速度
RUN echo "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.4/main/" > /etc/apk/repositories

RUN apk update \
      && apk upgrade \
      && apk add --no-cache tzdata \
      && rm -rf /var/cache/apk/* \
      && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
      && echo "Asia/Shanghai" > /etc/timezone \
      && apk del tzdata
