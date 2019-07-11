FROM alpine:3.9

MAINTAINER Jose Diaz-Gonzalez <dokku@josediazgonzalez.com>

RUN apk --no-cache add socat

ADD run.sh /bin/run.sh

ENTRYPOINT ["/bin/run.sh"]
