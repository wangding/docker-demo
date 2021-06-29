FROM node:alpine

RUN mkdir /hello
COPY ./app.js /hello/app.js
WORKDIR /hello

EXPOSE 8080
ENTRYPOINT ["node", "app.js"]
