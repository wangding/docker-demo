FROM node:alpine

RUN apk update && apk upgrade && apk add git docker-cli && mkdir /deploy
WORKDIR /deploy
COPY . .
RUN mkdir www && npm i --production

EXPOSE 8080
ENTRYPOINT ["node", "index.js"]
