FROM ubuntu:20.04
LABEL maintainer="cookun <cookun@sechelper.com>"

RUN apt update\
    && apt install -y wget

RUN wget https://go.dev/dl/go1.20.7.linux-amd64.tar.gz -O go1.20.7.linux-amd64.tar.gz
RUN tar -zxf go1.20.7.linux-amd64.tar.gz

ENV GO111MODULE=on
ENV GOPATH=${HOME}/go
ENV PATH=${PATH}:${GOPATH}/bin

ADD . $GOPATH/src/github.com/sechelper/github-action-example
WORKDIR $GOPATH/src/github.com/sechelper/github-action-example
RUN go build -ldflags "-s -w" -o github-action-example main.go

CMD ["github-action-example"]