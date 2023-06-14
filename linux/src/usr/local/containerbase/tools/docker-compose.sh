#!/bin/bash

set -e

require_root
check_command docker
check_semver "${TOOL_VERSION}"

if [[ ! "${MAJOR}" || ! "${MINOR}" || ! "${PATCH}" ]]; then
  echo Invalid version: "${TOOL_VERSION}"
  exit 1
fi


if [[ "${MAJOR}" -gt 1 ]]; then
  TARGET=/usr/local/lib/docker/cli-plugins/docker-compose
  DISTRO=linux-x86_64
  if [[ "${TOOL_VERSION}" -eq "2.0.0" ]]; then
    DISTRO=linux-amd64
  fi
  URL=https://github.com/docker/compose/releases/download/v${TOOL_VERSION}/docker-compose-${DISTRO}

  mkdir -p "/usr/local/lib/docker/cli-plugins"

  curl -sSfL "$URL" -o "${TARGET}"
  chmod +x "${TARGET}"

  docker compose version
  su "${USER_NAME}" -c "docker compose version"
else
  DISTRO=Linux-x86_64
  URL=https://github.com/docker/compose/releases/download/${TOOL_VERSION}/docker-compose-${DISTRO}
  TARGET=/usr/local/bin/docker-compose
  curl -sSfL "$URL" -o $TARGET
  chmod +x ${TARGET}
  docker-compose version
fi
