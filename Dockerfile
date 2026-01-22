FROM misotolar/backport-builder:latest

LABEL org.opencontainers.image.url="https://github.com/misotolar/docker-nut-builder"
LABEL org.opencontainers.image.description="Network UPS Tools (NUT) backport build container"
LABEL org.opencontainers.image.authors="Michal Sotolar <michal@sotolar.com>"

ENV BACKPORT_PACKAGE=nut
ENV BACKPORT_VERSION=2.8.4-2
ENV BACKPORT_RELEASE=msbpo13+1
ENV BACKPORT_UPSTREAM=2.8.4+really-2
