# project42/s6-alpine

[![pipeline status](https://git.jordanclark.us/devops/s6-alpine-docker/badges/master/pipeline.svg)](https://git.jordanclark.us/devops/s6-alpine-docker/commits/master)

## Introduction
A docker image based on Alpine Linux with the s6 process supervisor

### What is Alpine Linux?
Alpine Linux is an independent, non-commercial, general purpose Linux distribution designed for power users who appreciate security, simplicity and resource efficiency. Alpine Linux prides itself on being small, simple and secure.

### What is the s6-overlay?
The [s6-overlay project](https://github.com/just-containers/s6-overlay) is a series of init scripts and utilities to ease creating Docker images using s6 as a process supervisor.  The s6-overlay makes it easy to take advantages of s6 while still operate like other Docker images.  The s6 init system provides many helpful tools to initialize and manage processes as the Docker container starts.

### Tags

| Tag | Description |
|---|---|
| latest | The most current build.  Images based on latest may change often an possibly could break.  Test your images |
| 3.19 | Latest Alpine Linux 3.14 series |
| 3.18 | Latest Alpine Linux 3.14 series |
| 3.17 | Latest Alpine Linux 3.14 series |
| 3.16 | Latest Alpine Linux 3.14 series |
| 3.15 | Latest Alpine Linux 3.14 series |
| 3.14 | Latest Alpine Linux 3.14 series |
| 3.13 | Latest Alpine Linux 3.13 series |
| 3.12 | Latest Alpine Linux 3.12 series |
| 3.11 | Latest Alpine Linux 3.11 series |
| 3.10 | Latest Alpine Linux 3.10 series - Upstream end of support 2021-05-01 |
| 3.9 | Latest Alpine Linux 3.9 series - Upstream end of support 2020-11-01 |
| 3.8 | Latest Alpine Linux 3.8 series - Upstream end of support 2020-05-01 |
| 3.7 | Latest Alpine Linux 3.7 series - Upstream end of support 2019-11-01 |
| 3.6 | Latest Alpine Linux 3.6 series - Upstream end of support 2019-05-01 |
| 3.5 | Latest Alpine Linux 3.5 series - Upstream end of support 2018-11-01 |
| 3.4 | Latest Alpine Linux 3.4 series - Upstream end of support 2018-05-01 |
| 3.3 | Latest Alpine Linux 3.3 series - Upstream end of support 2017-11-01 |
| edge | Latest Alpine Linux edge series |
| 3.11.2 | Alpine Linux 3.11.2 built on 2019-01-13 |
| 3.10.3 | Alpine Linux 3.10.3 built on 2019-01-13 |
| 3.9.4 | Alpine Linux 3.9.4 built on 2019-01-13 |
| 3.8.4 | Alpine Linux 3.8.4 built on 2019-01-13 |
| 3.8.0 | Alpine Linux 3.8.0 built on 2018-07-30 |
| 3.7.3 | Alpine Linux 3.7.3 built on 2019-01-13 |
| 3.6.5 | Alpine Linux 3.6.5 built on 2019-01-13 |
| 3.5.3 | Alpine Linux 3.5.3 built on 2019-01-13 |
| 3.4.6 | Alpine Linux 3.4.6 built on 2019-01-13 |
| 3.3.3 | Alpine Linux 3.3.3 built on 2019-01-13 |
| 2.2.0.3 | Alpine Linux 3.14 with S6 Overlay v2.2.0.3 built on 2021-06-26 |
| 2.2.0.2 | Alpine Linux 3.14 with S6 Overlay v2.2.0.2 built on 2021-06-26 |
| 2.2.0.1 | Alpine Linux 3.14 with S6 Overlay v2.2.0.1 built on 2021-06-26 |
| 2.2.0.0 | Alpine Linux 3.12 with S6 Overlay v2.2.0.0 built on 2021-06-26 |
| 2.1.0.2 | Alpine Linux 3.12 with S6 Overlay v2.1.0.2 built on 2020-11-30 |
| 2.1.0.1 | Alpine Linux 3.12 with S6 Overlay v2.1.0.1 built on 2020-11-30 |
| 2.1.0.0 | Alpine Linux 3.12 with S6 Overlay v2.1.0.0 built on 2020-11-30 |
| 2.0.0.1 | Alpine Linux 3.12 with S6 Overlay v2.0.0.1 built on 2020-11-30 |
| 2.0.0.0 | Alpine Linux 3.12 with S6 Overlay v2.0.0.0 built on 2020-11-30 |
| 1.22.1.0 | Alpine Linux 3.11 with S6 Overlay v1.22.1.0 built on 2019-01-13 |
| 1.22.0.0 | Alpine Linux 3.10 with S6 Overlay v1.22.0.0 built on 2019-01-13 |
| 1.21.8.0 | Alpine Linux 3.8 with S6 Overlay v1.21.8.0 built on 2019-01-13 |
| 1.21.4.0 | Alpine Linux 3.7 with S6 Overlay v1.21.4.0 built on 2018-07-12 |
| 1.20.0.0 | Alpine Linux 3.6 with S6 Overlay v1.20.0.0 built on 2017-09-26 |
| 1.19.1.1 | Alpine Linux 3.4 with S6 Overlay v1.19.1.1 built on 2017-02-02 |
| 1.19.1.0 | Alpine Linux 3.4 with S6 Overlay v1.19.1.0 built on 2017-02-02 |
| 1.19.0.0 | Alpine Linux 3.4 with S6 Overlay v1.19.0.0 built on 2017-02-02 |
| 1.18.1.5 | Alpine Linux 3.4 with S6 Overlay v1.18.1.5 built on 2016-09-21 |
| 1.18.1.4 | Alpine Linux 3.4 with S6 Overlay v1.18.1.4 built on 2016-09-21 |
| 1.18.1.3 | Alpine Linux 3.4 with S6 Overlay v1.18.1.3 built on 2016-09-21 |
| 1.18.1.2 | Alpine Linux 3.4 with S6 Overlay v1.18.1.2 built on 2016-09-21 |
| 1.18.1.1 | Alpine Linux 3.4 with S6 Overlay v1.18.1.1 built on 2016-09-21 |
| 1.18.1.0 | Alpine Linux 3.4 with S6 Overlay v1.18.1.0 built on 2016-09-21 |
| 1.18.0.0 | Alpine Linux 3.4 with S6 Overlay v1.18.0.0 built on 2016-09-21 |
| 1.17.2.0 | Alpine Linux 3.4 with S6 Overlay v1.17.2.0 built on 2016-09-21 |

### Issues

I'm sure there are some but currently I'm unaware of current issues.  If you find an issue please let me know on [GitHub](https://github.com/p42/s6-alpine-docker/issues)

### Prerequisites

A working docker daemon would be helpful to utilize this image.

## How to use this image

This image is meant to be used as a base to build custom docker images from.  It's value is that it takes the base alpine linux image and adds the s6 Overlay.

### Usage

###### Running a quick alpine linux container

~~~
docker run --rm -ti project42/s6-alpine:latest sh
~~~

This will present you with a shell on fresh container that will stop and remove itself when you exit the container.

###### Dockerfile that is based of of this image.

~~~
FROM project42/s6-alpine:latest

RUN apk --no-cache --update upgrade && \
apk add --no-cache rsync

ENTRYPOINT ["/init"]
~~~

## Configuration

### Configuration Parameters
| Environment | Description |
| --- | --- |
| TZ | Sets the container Timezone; example: CST6CDT default: UTC |  

## Maintenance

### Shell Access

This image includes the sh shell and when running in detached mode can be connected to with:

~~~
docker exec -ti <container> sh
~~~


## References

Maintainer: [https://jordanclark.us](https://jordanclark.us)

Maintainer's git repo: [https://git.jordanclark.us/devops/s6-alpine-docker](https://git.jordanclark.us/devops/s6-alpine-docker)

Github Issues: [https://github.com/p42/s6-alpine-docker/issues](https://github.com/p42/s6-alpine-docker/issues)

Alpine Linux: [https://www.alpinelinux.org](https://www.alpinelinux.org)

s6-overlay: [https://github.com/just-containers/s6-overlay](https://github.com/just-containers/s6-overlay)

s6 supervisor: [http://www.skarnet.org/software/s6/index.html](http://www.skarnet.org/software/s6/index.html)
