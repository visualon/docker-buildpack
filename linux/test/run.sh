#!/bin/bash

set -ex

git --version

# renovate: datasource=github-releases packageName=minio/mc
install-tool minio-client RELEASE.2023-10-30T18-43-32Z

# renovate: datasource=github-releases packageName=visualon/skopeo-prebuild
install-tool skopeo 1.13.3

skopeo inspect docker://registry.fedoraproject.org/fedora:latest | jq -r '.Name+"@"+.Digest'

# renovate: datasource=github-releases packageName=kubernetes/kubernetes
install-tool kubectl v1.28.3

# renovate: datasource=github-releases packageName=moby/moby
install-tool docker v24.0.7

# renovate: datasource=github-releases packageName=docker/compose
install-tool docker-compose 1.29.2

# renovate: datasource=github-releases packageName=docker/compose
install-tool docker-compose v2.23.0

# renovate: datasource=github-releases packageName=docker/buildx
install-tool buildx v0.11.2

# renovate: datasource=github-releases packageName=kubernetes-sigs/kustomize
install-tool kustomize 4.0.4
