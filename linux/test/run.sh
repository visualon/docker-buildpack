#!/bin/bash

set -ex

git --version

# renovate: datasource=github-releases packageName=minio/mc
install-tool minio-client RELEASE.2023-12-29T20-15-29Z

# renovate: datasource=github-releases packageName=containerbase/skopeo-prebuild
install-tool skopeo 1.21.0

skopeo inspect docker://registry.fedoraproject.org/fedora:latest | jq -r '.Name+"@"+.Digest'

# renovate: datasource=github-releases packageName=kubernetes/kubernetes
install-tool kubectl v1.35.0

# renovate: datasource=github-releases packageName=moby/moby
install-tool docker v28.5.2

# renovate: datasource=github-releases packageName=docker/compose
install-tool docker-compose v2.40.3

# renovate: datasource=github-releases packageName=docker/buildx
install-tool buildx v0.31.0

# renovate: datasource=github-releases packageName=kubernetes-sigs/kustomize
install-tool kustomize 4.0.4

# renovate: datasource=github-releases packageName=getsops/sops
install-tool sops v3.11.0
