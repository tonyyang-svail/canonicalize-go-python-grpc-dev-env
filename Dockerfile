FROM python:3.7

RUN pip install --upgrade pip
RUN pip install grpcio-tools

RUN apt-get update
RUN apt-get install -y wget curl

RUN wget --quiet https://dl.google.com/go/go1.11.5.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.11.5.linux-amd64.tar.gz
RUN rm go1.11.5.linux-amd64.tar.gz
ENV PATH $PATH:/usr/local/go/bin

RUN wget --quiet https://github.com/protocolbuffers/protobuf/releases/download/v3.6.1/protoc-3.6.1-linux-x86_64.zip
RUN apt-get install -y unzip
RUN unzip -qq protoc-3.6.1-linux-x86_64.zip -d /usr/local
RUN rm protoc-3.6.1-linux-x86_64.zip

RUN mkdir -p /go
ENV GOPATH /go
RUN go get github.com/golang/protobuf/protoc-gen-go
RUN mv /go/bin/protoc-gen-go /usr/local/bin/
