#!/bin/bash

set -e

require_root
check_command docker
check_semver "${TOOL_VERSION}"

if [[ ! "${MAJOR}" || ! "${MINOR}" || ! "${PATCH}" ]]; then
  echo Invalid version: "${TOOL_VERSION}"
  exit 1
fi

DISTRO=linux-amd64
URL=https://github.com/docker/buildx/releases/download/v${TOOL_VERSION}/buildx-v${TOOL_VERSION}.${DISTRO}
TARGET=/usr/local/lib/docker/cli-plugins/docker-buildx

mkdir -p /usr/local/lib/docker/cli-plugins

curl -sL "$URL" -o "${TARGET}"
chmod +x "${TARGET}"

docker buildx version
su "${USER_NAME}" -c "docker buildx version"
