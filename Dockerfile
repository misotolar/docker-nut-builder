FROM misotolar/backport-builder:latest

LABEL org.opencontainers.image.url="https://github.com/misotolar/docker-nut-builder"
LABEL org.opencontainers.image.description="Network UPS Tools (NUT) backport build container"
LABEL org.opencontainers.image.authors="Michal Sotolar <michal@sotolar.com>"

ENV NUT_VERSION=2.8.3
ARG NUT_RELEASE=3
ARG NUT_SHA256=9c59dc705b9404fe8db3c3d4cd17578d170a77e77dda397501f3ab4924f33ee9
ADD https://salsa.debian.org/debian/nut/-/archive/debian/$NUT_VERSION-$NUT_RELEASE/nut-debian-$NUT_VERSION-$NUT_RELEASE.tar.gz /tmp/nut.tar.gz

WORKDIR /build/nut

RUN set -ex; \
    apt-get update -y; \
    apt-get install --no-install-recommends -y \
        dh-exec \
        systemd \
    ; \
    apt-get build-dep -y \
        nut \
    ; \
    echo "$NUT_SHA256 */tmp/nut.tar.gz" | sha256sum -c -; \
    tar xf /tmp/nut.tar.gz --strip-components=1; \
    dch -v $NUT_VERSION-$NUT_RELEASE+misotolar "Backport $NUT_VERSION-$NUT_RELEASE release"; \
    rm -rf \
        /var/lib/apt/lists/* \
        /var/tmp/* \
        /tmp/*
