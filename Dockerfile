FROM alpine:edge
MAINTAINER Jordan Clark mail@jordanclark.us

ARG arch=x86_64
ARG s6_overlay_version=3.1.6.2
ARG s6_overlay_arch_hash=9c782f0c8ace291fb8d30be8ed748271
ARG s6_overlay_noarch_hash=d11e1acb32daa8f370048d621fb12685

# ENV ARCH=${arch}

COPY container-files /

RUN apk add --no-cache wget ca-certificates && \
apk --no-cache --update upgrade && \
cd /tmp && \
wget https://github.com/just-containers/s6-overlay/releases/download/v${s6_overlay_version}/s6-overlay-noarch.tar.xz && \
echo "${s6_overlay_noarch_hash} *s6-overlay-noarch.tar.xz" | md5sum -c - && \
wget https://github.com/just-containers/s6-overlay/releases/download/v${s6_overlay_version}/s6-overlay-${arch}.tar.xz && \
echo "${s6_overlay_arch_hash} *s6-overlay-${arch}.tar.xz" | md5sum -c - && \
tar -C / -Jxpf /tmp/s6-overlay-noarch.tar.xz && \
tar -C / -Jxpf /tmp/s6-overlay-${arch}.tar.xz && \
rm s6-overlay-noarch.tar.xz && \
rm s6-overlay-${arch}.tar.xz

ENTRYPOINT ["/init"]
