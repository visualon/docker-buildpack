#!/bin/bash

set -e

# RELEASE.2022-05-09T04-08-26Z
# check_semver ${TOOL_VERSION}

# if [[ ! "${MAJOR}" || ! "${MINOR}" || ! "${PATCH}" ]]; then
#   echo Invalid version: ${TOOL_VERSION}
#   exit 1
# fi

DISTRO=linux-amd64
URL="https://github.com/minio/mc/releases/download/${TOOL_VERSION}/mc.${DISTRO}.${TOOL_VERSION}"

curl -sSfL "$URL" -o /usr/local/bin/mc
chmod +x /usr/local/bin/mc

mc --version
