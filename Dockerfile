FROM gliderlabs/alpine
MAINTAINER Jordan Clark jordan.clark@esu10.org

RUN apk add --no-cache ca-certificates s6

COPY container-files /

ENTRYPOINT ["/bin/s6-svscan","/etc/s6"]
