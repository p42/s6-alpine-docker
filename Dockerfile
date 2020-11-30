FROM alpine:3.11
MAINTAINER Jordan Clark mail@jordanclark.us

ENV S6_OVERLAY_VERSION 2.0.0.0
ENV S6_OVERLAY_MD5HASH 98bdfca4102c6ac52def54b64221184f

COPY container-files /

RUN apk add --no-cache wget ca-certificates && \
apk --no-cache --update upgrade && \
cd /tmp && \
wget https://github.com/just-containers/s6-overlay/releases/download/v$S6_OVERLAY_VERSION/s6-overlay-amd64.tar.gz && \
echo "$S6_OVERLAY_MD5HASH *s6-overlay-amd64.tar.gz" | md5sum -c - && \
tar xzf s6-overlay-amd64.tar.gz -C / && \
rm s6-overlay-amd64.tar.gz

ENTRYPOINT ["/init"]
