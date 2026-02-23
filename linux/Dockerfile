FROM ghcr.io/containerbase/base:14.4.5@sha256:b7ee52fbe096de7262adb48975602376d2607a08097f244181d93211abb6b20a


LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>" \
  org.opencontainers.image.authors="VisualOn GmbH <code@visualon.de>" \
  org.opencontainers.image.licenses="MIT" \
  org.opencontainers.image.source="https://github.com/visualon/docker-buildpack" \
  org.opencontainers.image.url="https://github.com/visualon/docker-buildpack"

RUN install-apt \
  jq \
  rsync \
  && mkdir -p ~/.ssh \
  && chmod 700 ~/.ssh

COPY src/ /
