FROM node:alpine

RUN mkdir /abc-web
WORKDIR /abc-web
COPY . .
RUN npm i --production

EXPOSE 8080
ENTRYPOINT ["node", "index.js"]
