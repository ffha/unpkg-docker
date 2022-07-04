FROM alpine
ENV JAVA_HOME=/opt/java/openjdk
COPY --from=eclipse-temurin:11 $JAVA_HOME $JAVA_HOME
ENV PATH="${JAVA_HOME}/bin:${PATH}"
RUN apk add curl wget openssl ca-certificates git nodejs-current npm
RUN npm install -g yarn
RUN npm i -g google-closure-compiler
RUN mkdir /app
WORKDIR /app
RUN git clone https://github.com/unpkg/origin.git unpkg
WORKDIR /app/unpkg
RUN npm install
RUN npm run build
ENV NODE_ENV production
CMD [ "node", "server.js" ]
