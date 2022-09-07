ARG VERSION=3.6.6
FROM openjdk:8-jdk-alpine

WORKDIR /app/arthas

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk add --no-cache wget \
    && wget -O /app/arthas https://ghproxy.com/https://github.com/alibaba/arthas/releases/download/arthas-all-$VERSION/arthas-tunnel-server-$VERSION-fatjar.jar

ENTRYPOINT [ "java", "-jar", "/app/arthas/*.jar" ]