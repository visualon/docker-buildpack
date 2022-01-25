FROM ghcr.io/containerbase/buildpack:3.2.3@sha256:31e3b85387934e330d9fcddf793ae07c60d23e6ad3d01a070b4060594eedb8f7


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
