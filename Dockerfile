FROM node:12-alpine
RUN echo -e "https://mirror.tuna.tsinghua.edu.cn/alpine/latest-stable/community" > /etc/apk/repositories
RUN apk add curl wget openssl ca-certificates git openjdk8-jre-base
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk
ENV PATH ${PATH}:${JAVA_HOME}/bin
RUN mkdir /app
WORKDIR /app
RUN git clone https://github.com/mjackson/unpkg.git
WORKDIR /app/unpkg
RUN npm install
RUN npm run build
ENV NODE_ENV production
CMD [ "node", "server.js" ]
