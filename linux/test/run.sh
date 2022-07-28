#!/bin/bash

set -ex

git --version

# renovate: datasource=github-releases lookupName=minio/mc
install-tool minio-client RELEASE.2022-07-24T02-25-13Z

# renovate: datasource=github-releases lookupName=visualon/skopeo-prebuild
install-tool skopeo 1.9.1

skopeo inspect docker://registry.fedoraproject.org/fedora:latest | jq -r '.Name+"@"+.Digest'

# renovate: datasource=github-tags lookupName=kubernetes/kubectl
install-tool kubectl 1.20.1

# renovate: datasource=github-releases lookupName=moby/moby
install-tool docker v20.10.17

# renovate: datasource=github-releases lookupName=docker/compose
install-tool docker-compose 1.29.2

# renovate: datasource=github-releases lookupName=docker/compose
install-tool docker-compose 2.7.0

# renovate: datasource=github-releases lookupName=docker/buildx
install-tool buildx v0.8.2

# renovate: datasource=github-releases lookupName=kubernetes-sigs/kustomize
install-tool kustomize 4.0.4
