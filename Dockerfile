FROM docker:latest

# emulate golang:alpine
ENV GOPATH /go
ENV PATH $GOPATH/bin:$PATH
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"
WORKDIR $GOPATH

COPY --from=docker/buildx-bin /buildx /usr/libexec/docker/cli-plugins/docker-buildx

RUN apk --no-cache add go alpine-sdk olm-dev && \
		go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
