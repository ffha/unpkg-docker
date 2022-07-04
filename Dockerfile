FROM eclipse-temurin:8-alpine
RUN apk add curl wget openssl ca-certificates git nodejs-current npm
RUN npm install -g yarn
RUN mkdir /app
WORKDIR /app
RUN git clone https://github.com/mjackson/unpkg.git
WORKDIR /app/unpkg
RUN npm install
RUN npm run build
ENV NODE_ENV production
CMD [ "node", "server.js" ]
