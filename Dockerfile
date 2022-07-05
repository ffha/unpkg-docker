FROM node:16-alpine
RUN apk add curl wget openssl ca-certificates git python3 make build-base
RUN npm install -g yarn
RUN mkdir /app
WORKDIR /app
RUN npm install unpkg-server2 --force
CMD [ "node", "node_modules/unpkg-server2/server.js" ]
