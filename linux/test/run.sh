#!/bin/bash

set -ex

git --version

# renovate: datasource=github-releases packageName=minio/mc
install-tool minio-client RELEASE.2023-07-18T21-05-38Z

# renovate: datasource=github-releases packageName=visualon/skopeo-prebuild
install-tool skopeo 1.13.0

skopeo inspect docker://registry.fedoraproject.org/fedora:latest | jq -r '.Name+"@"+.Digest'

# renovate: datasource=github-releases packageName=kubernetes/kubernetes
install-tool kubectl v1.27.3

# renovate: datasource=github-releases packageName=moby/moby
install-tool docker v24.0.4

# renovate: datasource=github-releases packageName=docker/compose
install-tool docker-compose 1.29.2

# renovate: datasource=github-releases packageName=docker/compose
install-tool docker-compose v2.20.1

# renovate: datasource=github-releases packageName=docker/buildx
install-tool buildx v0.11.2

# renovate: datasource=github-releases packageName=kubernetes-sigs/kustomize
install-tool kustomize 4.0.4
