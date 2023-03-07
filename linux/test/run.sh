#!/bin/bash

set -ex

git --version

# renovate: datasource=github-releases packageName=minio/mc
install-tool minio-client RELEASE.2023-02-28T00-12-59Z

# renovate: datasource=github-releases packageName=visualon/skopeo-prebuild
install-tool skopeo 1.10.0

skopeo inspect docker://registry.fedoraproject.org/fedora:latest | jq -r '.Name+"@"+.Digest'

# renovate: datasource=github-tags packageName=kubernetes/kubectl
install-tool kubectl 1.20.1

# renovate: datasource=github-releases packageName=moby/moby
install-tool docker v20.10.23

# renovate: datasource=github-releases packageName=docker/compose
install-tool docker-compose 1.29.2

# renovate: datasource=github-releases packageName=docker/compose
install-tool docker-compose 2.7.0

# renovate: datasource=github-releases packageName=docker/buildx
install-tool buildx v0.10.4

# renovate: datasource=github-releases packageName=kubernetes-sigs/kustomize
install-tool kustomize 4.0.4
