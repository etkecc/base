FROM alpine:latest

# emulate golang:alpine
ENV GOPATH /go
ENV PATH $GOPATH/bin:$PATH
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"
WORKDIR $GOPATH

RUN apk --no-cache add go docker-cli docker-cli-buildx alpine-sdk olm-dev && \
		docker buildx install && \
		go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
