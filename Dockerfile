FROM node:alpine

COPY ./index.js /ci-app/index.js

ENTRYPOINT ["node", "/ci-app/index.js"]
