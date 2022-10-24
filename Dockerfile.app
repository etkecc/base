FROM alpine:latest

RUN apk --no-cache add ca-certificates tzdata olm && \
    adduser -D -g '' app && \
    mkdir /data && chown -R app /data
