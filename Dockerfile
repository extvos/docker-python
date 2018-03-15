FROM extvos/alpine:3.6
MAINTAINER  "Mingcai SHEN <archsh@gmail.com>"
ENV PYTHON_MAJOR   2.7
ENV PYTHON_VERSION 2.7.12

RUN apk update && apk add --no-cache python py-pip 