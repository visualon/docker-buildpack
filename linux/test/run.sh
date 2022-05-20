#!/bin/bash

set -ex

git --version

# renovate: datasource=github-releases lookupName=minio/mc
install-tool minio-client RELEASE.2022-05-09T04-08-26Z
