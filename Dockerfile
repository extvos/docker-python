FROM extvos/alpine
MAINTAINER  "Mingcai SHEN <archsh@gmail.com>"
ENV PYTHON_MAJOR   2.7
ENV PYTHON_VERSION 2.7.12

RUN apk update && apk add python py-pip 