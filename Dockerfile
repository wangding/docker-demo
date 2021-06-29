FROM node:alpine

RUN mkdir /todo-list-api
COPY ./todo-list-api/ /todo-list-api/
WORKDIR /todo-list-api
RUN npm i --production

EXPOSE 8080
ENTRYPOINT ["node", "app.js"]
