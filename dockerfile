# syntax=docker/dockerfile:1
# https://hub.docker.com/_/golang
FROM golang:latest

RUN mkdir app
WORKDIR /app

COPY go.mod ./
COPY go.sum ./

RUN go mod download

COPY *.go ./

RUN go build -o /docker-gs-ping


EXPOSE 8080