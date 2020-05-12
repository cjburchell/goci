FROM golang:1.14

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

RUN mkdir /go/src/gopkg.in
RUN chmod 777 /go/src/gopkg.in

RUN mkdir /go/src/google.golang.org
RUN chmod 777 /go/src/google.golang.org

RUN mkdir /go/src/cloud.google.com
RUN chmod 777 /go/src/cloud.google.com

RUN go get -u golang.org/x/lint/golint/...
RUN go get -u github.com/tebeka/go2xunit

RUN chmod 777 /go/src