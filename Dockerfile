FROM alpine:3.10.3

MAINTAINER Jose Diaz-Gonzalez <dokku@josediazgonzalez.com>

RUN apk --no-cache add socat

ADD entrypoint /entrypoint

ENTRYPOINT ["/entrypoint"]
