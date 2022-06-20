FROM alpine:latest

# emulate golang:alpine
ENV GOPATH /go
ENV GOPROXY direct
ENV PATH $GOPATH/bin:$PATH
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"
WORKDIR $GOPATH

RUN apk --no-cache add go alpine-sdk olm-dev && \
		git clone --depth 1 https://gitlab.com/etke.cc/emm.git && \
		cd emm && make build && mv emm /bin/emm && cd .. && rm -rf emm && \
		git clone --depth 1 https://git.sr.ht/~xn/openring && \
		cd openring && go build -v -o openring . && mv openring /bin/openring && cd .. && rm -rf openring && \
		go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
