FROM alpine
RUN apk add curl wget openssl ca-certificates git nodejs-current npm nodejs-current-dev python3 make build-base
RUN npm install -g yarn
RUN mkdir /app
WORKDIR /app
RUN npm install unpkg-server
ARG PORT 80
EXPOSE 80
CMD [ "node", "node_modules/unpkg-server/server.js", "--PORT=80" ]
