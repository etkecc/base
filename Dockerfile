FROM golang:alpine

RUN apk --no-cache add alpine-sdk olm-dev
RUN go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
