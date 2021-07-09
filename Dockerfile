FROM node:alpine

COPY . /ci-app
WORKDIR /ci-app

ENTRYPOINT ["node", "index.js"]
