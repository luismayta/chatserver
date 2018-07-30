FROM golang:1.10.0-alpine3.7

MAINTAINER Luis Mayta <@slovacus>

ARG env
ARG version

LABEL NAME chatserver-app-$env
LABEL VERSION $version

ENV buildpath=/go/src/github.com/luismayta/chatserver

COPY glide.* ${buildpath}/

RUN mkdir -p ${buildpath} \
    && apk add --update --no-cache \
    build-base bash \
    openssl-dev libffi-dev \
    ca-certificates  \
    git curl openssl wget \
    && go get -v github.com/golang/dep/cmd/dep \
    && go get -v github.com/Masterminds/glide \
    && cd ${buildpath} && glide update \
    # Clean files unnecesary
    && rm -rf /var/cache/apk/*

# set working directory to /usr/src/
WORKDIR $buildpath
