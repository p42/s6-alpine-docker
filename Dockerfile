FROM gliderlabs/alpine
MAINTAINER Jordan Clark jordan.clark@esu10.org

RUN apk add --no-cache ca-certificates && \
cd /tmp && \
wget https://github.com/just-containers/s6-overlay/releases/download/v1.17.1.2/s6-overlay-amd64.tar.gz && \
tar xzf s6-overlay-amd64.tar.gz -C / && \
rm s6-overlay-amd64.tar.gz

COPY container-files /

ENTRYPOINT ["/init"]
