FROM ghcr.io/containerbase/base:14.25.1@sha256:d726ebe68a17efc4b0232453dade0f4b74c973ae438164336fc1b9894914e819


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
