FROM ghcr.io/containerbase/base:14.31.0@sha256:cff8880b751e44856ab0bbd37e1a83e4d8139e0a1849609b6f9f86e3e75123f0


LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>" \
  org.opencontainers.image.authors="VisualOn GmbH <code@visualon.de>" \
  org.opencontainers.image.licenses="MIT" \
  org.opencontainers.image.source="https://github.com/visualon/docker-buildpack" \
  org.opencontainers.image.url="https://github.com/visualon/docker-buildpack"

RUN install-apt \
  jq \
  libatomic1 \
  rsync \
  && mkdir -p ~/.ssh \
  && chmod 700 ~/.ssh

COPY src/ /
