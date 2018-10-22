FROM golang:1.11

RUN go get -u golang.org/x/lint/golint/...
RUN go get -u github.com/tebeka/go2xunit