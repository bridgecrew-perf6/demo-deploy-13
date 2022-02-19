# syntax=docker/dockerfile:1
# https://hub.docker.com/_/golang
FROM golang:latest

RUN mkdir app
WORKDIR /app

COPY go.mod ./
COPY go.sum ./

RUN go mod download

COPY *.go ./
RUN go get github.com/hmhieu18/demo-deploy/chat 
RUN go build -o /demo-deploy


EXPOSE 8080