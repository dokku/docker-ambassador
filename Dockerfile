FROM alpine:3.20.1

# hadolint ignore=DL3018
RUN apk --no-cache add socat

COPY entrypoint /entrypoint

ENTRYPOINT ["/entrypoint"]
