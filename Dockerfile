FROM golang:1.13

env GOCACHE=/tmp/.cache
RUN mkdir /tmp/.cache
RUN chmod 777 /tmp/.cache

RUN mkdir /go/src/github.com
RUN chmod 777 /go/src/github.com

RUN mkdir /go/src/github.com/cjburchell
RUN chmod 777 /go/src/github.com/cjburchell

RUN mkdir /go/src/golang.org
RUN chmod 777 /go/src/golang.org

RUN mkdir /go/src/golang.org/x
RUN chmod 777 /go/src/golang.org/x

RUN go get -u golang.org/x/lint/golint/...
RUN go get -u github.com/tebeka/go2xunit