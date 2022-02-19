# syntax=docker/dockerfile:1
# https://hub.docker.com/_/golang
FROM golang:latest

RUN mkdir app
WORKDIR /app

COPY go.mod ./
COPY go.sum ./

RUN go mod download

COPY *.go ./
RUN go get .

RUN go build -o /demo-deploy

ENTRYPOINT ["go", "run", "server.go", "-http-port=9000"]
EXPOSE 9000