FROM alpine:latest

RUN apk --no-cache add go docker docker-cli-buildx alpine-sdk olm-dev
RUN go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
