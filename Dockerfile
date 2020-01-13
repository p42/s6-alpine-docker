FROM alpine:edge
MAINTAINER Jordan Clark mail@jordanclark.us

ENV S6_OVERLAY_VERSION 1.21.8.0
ENV S6_OVERLAY_MD5HASH 93b118b589e12fadc2d1ff58fa79751f

COPY container-files /

RUN apk add --no-cache wget ca-certificates && \
apk --no-cache --update upgrade && \
cd /tmp && \
wget https://github.com/just-containers/s6-overlay/releases/download/v$S6_OVERLAY_VERSION/s6-overlay-amd64.tar.gz && \
echo "$S6_OVERLAY_MD5HASH *s6-overlay-amd64.tar.gz" | md5sum -c - && \
tar xzf s6-overlay-amd64.tar.gz -C / && \
rm s6-overlay-amd64.tar.gz

ENTRYPOINT ["/init"]
