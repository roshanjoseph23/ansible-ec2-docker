FROM node:15
WORKDIR /usr/src/app
COPY nodejs/package*.json ./
RUN npm install
COPY nodejs/server.js .
EXPOSE 80
CMD [ "node", "server.js" ]