FROM golang:1.8.0-alpine

RUN go get -u github.com/golang/dep/..
RUN go get -u github.com/golang/lint/golint
RUN go get github.com/tebeka/go2xunit