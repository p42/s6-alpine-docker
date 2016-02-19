FROM gliderlabs/alpine
MAINTAINER Jordan Clark jordan.clark@esu10.org

ENV S6_OVERLAY_VERSION 1.17.1.2

RUN apk add --no-cache ca-certificates && \
cd /tmp && \
wget https://github.com/just-containers/s6-overlay/releases/download/v$S6_OVERLAY_VERSION/s6-overlay-amd64.tar.gz && \
tar xzf s6-overlay-amd64.tar.gz -C / && \
rm s6-overlay-amd64.tar.gz

COPY container-files /

ENTRYPOINT ["/init"]
