FROM alpine:3.18

ARG BUILD_DATE
ARG VCS_REF

LABEL maintainer="mail@jordanclark.us" \
    org.opencontainers.image.title="s6-alpine" \
    org.opencontainers.image.description="Alpine Base with S6 Overlay" \
    org.opencontainers.image.authors="mail@jordanclark.us" \
    org.opencontainers.image.vendor="Alpine" \
    org.opencontainers.image.documentation="https://docs.alpinelinux.org" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.url="https://alpinelinux.org" \
    org.opencontainers.image.revision=$VCS_REF \
    org.opencontainers.image.created=$BUILD_DATE

ARG arch=x86_64
ARG s6_overlay_version=3.1.6.2
ARG s6_overlay_arch_hash=9c782f0c8ace291fb8d30be8ed748271
ARG s6_overlay_noarch_hash=d11e1acb32daa8f370048d621fb12685
ARG s6_overlay_symlinks_arch_hash=f6a58d346f79d02ddffe4fd23baf9e99
ARG s6_overlay_symlinks_noarch_hash=2090db2192109dc3fe08bfd1f7b245f6

COPY container-files /

RUN apk add --no-cache wget ca-certificates && \
apk --no-cache --update upgrade && \
cd /tmp && \
wget https://github.com/just-containers/s6-overlay/releases/download/v${s6_overlay_version}/s6-overlay-noarch.tar.xz && \
echo "${s6_overlay_noarch_hash} *s6-overlay-noarch.tar.xz" | md5sum -c - && \
wget https://github.com/just-containers/s6-overlay/releases/download/v${s6_overlay_version}/s6-overlay-${arch}.tar.xz && \
echo "${s6_overlay_arch_hash} *s6-overlay-${arch}.tar.xz" | md5sum -c - && \
wget https://github.com/just-containers/s6-overlay/releases/download/v${s6_overlay_version}/s6-overlay-symlinks-arch.tar.xz && \
echo "${s6_overlay_symlinks_arch_hash} *s6-overlay-symlinks-arch.tar.xz" | md5sum -c - && \
wget https://github.com/just-containers/s6-overlay/releases/download/v${s6_overlay_version}/s6-overlay-symlinks-noarch.tar.xz && \
echo "${s6_overlay_symlinks_noarch_hash} *s6-overlay-symlinks-noarch.tar.xz" | md5sum -c - && \
tar -C / -Jxpf /tmp/s6-overlay-noarch.tar.xz && \
tar -C / -Jxpf /tmp/s6-overlay-${arch}.tar.xz && \
tar -C / -Jxpf /tmp/s6-overlay-symlinks-arch.tar.xz && \
tar -C / -Jxpf /tmp/s6-overlay-symlinks-noarch.tar.xz && \
rm s6-overlay-noarch.tar.xz && \
rm s6-overlay-${arch}.tar.xz && \
rm s6-overlay-symlinks-arch.tar.xz && \
rm s6-overlay-symlinks-noarch.tar.xz

ENTRYPOINT ["/init"]
