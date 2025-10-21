FROM misotolar/backport-builder:latest

LABEL org.opencontainers.image.url="https://github.com/misotolar/docker-nut-builder"
LABEL org.opencontainers.image.description="Network UPS Tools (NUT) backport build container"
LABEL org.opencontainers.image.authors="Michal Sotolar <michal@sotolar.com>"

ENV NUT_VERSION=2.8.4
ARG NUT_RELEASE=really-2
ARG NUT_SHA256=7823c83415e01552feabce3ce84f21fc954998623726b02978d89d720a218d83
ADD https://salsa.debian.org/debian/nut/-/archive/debian/$NUT_VERSION+$NUT_RELEASE/nut-debian-$NUT_VERSION+$NUT_RELEASE.tar.gz /tmp/nut.tar.gz

WORKDIR /build/nut

RUN set -ex; \
    apt-get update -y; \
    apt-get install --no-install-recommends -y \
        dh-exec \
        source-highlight \
        systemd \
    ; \
    apt-get build-dep -y \
        nut \
    ; \
    echo "$NUT_SHA256 */tmp/nut.tar.gz" | sha256sum -c -; \
    tar xf /tmp/nut.tar.gz --strip-components=1; \
    dch -v $NUT_VERSION+$NUT_RELEASE+misotolar "Backport $NUT_VERSION+$NUT_RELEASE release"; \
    rm -rf \
        /var/lib/apt/lists/* \
        /var/tmp/* \
        /tmp/*
