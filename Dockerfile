FROM alpine:3.23.0

# hadolint ignore=DL3018
RUN apk --no-cache add socat

COPY entrypoint /entrypoint

ENTRYPOINT ["/entrypoint"]
