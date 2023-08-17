FROM ghcr.io/containerbase/base:9.11.0@sha256:f960b1e3adf414cb820cd5fb5b441236bcd2156e49155fc81cb8e98a08956b0e


LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>" \
  org.opencontainers.image.authors="VisualOn GmbH <code@visualon.de>" \
  org.opencontainers.image.licenses="MIT" \
  org.opencontainers.image.source="https://github.com/visualon/docker-buildpack" \
  org.opencontainers.image.url="https://github.com/visualon/docker-buildpack"

RUN install-apt \
  jq \
  libgcc1 \
  libicu66 \
  rsync \
  && mkdir -p ~/.ssh \
  && chmod 700 ~/.ssh

COPY src/ /
