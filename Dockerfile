FROM golang:1.12

env GOCACHE=/tmp/.cache
RUN mkdir /tmp/.cache
RUN chmod 777 /tmp/.cache

RUN ls /go/src
RUN chmod 777 /go/src

RUN go get -u golang.org/x/lint/golint/...
RUN go get -u github.com/tebeka/go2xunit