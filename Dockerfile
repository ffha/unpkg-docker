FROM node:12-alpine
RUN apk add curl wget openssl ca-certificates git openjdk8-jre-base
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk
ENV PATH $PATH:/usr/lib/jvm/java-1.8-openjdk/bin
RUN mkdir /app
WORKDIR /app
RUN git clone https://github.com/mjackson/unpkg.git
WORKDIR /app/unpkg
RUN npm install
RUN npm run build
ENV NODE_ENV production
CMD [ "node", "server.js" ]
