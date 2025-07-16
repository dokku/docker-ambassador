FROM alpine:3.22.1

# hadolint ignore=DL3018
RUN apk --no-cache add socat

COPY entrypoint /entrypoint

ENTRYPOINT ["/entrypoint"]
