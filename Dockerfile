FROM node:16-alpine
RUN apk add curl wget openssl ca-certificates git python3 make build-base
RUN mkdir /app
WORKDIR /app
RUN git clone https://github.com/ffha/unpkg-server.git
RUN npm update
RUN npm install
RUN npm run build
CMD [ "node", "server.js" ]
