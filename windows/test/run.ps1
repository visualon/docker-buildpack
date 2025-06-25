#Requires -Version 5.1

$ErrorActionPreference = 'Stop'
$DebugPreference = 'Continue'

. c:\tools\lib\exec.ps1

# renovate: datasource=github-releases packageName=getsops/sops
install-tool sops v3.10.2

# renovate: datasource=github-releases packageName=PowerShell/PowerShell
install-tool powershell v7.5.2
pwsh --version
ExitOnNativeFailure

# renovate: datasource=adoptium-java packageName=java-jre
install-tool java 21.0.7+6.0.LTS
java --version
ExitOnNativeFailure

# renovate: datasource=node
install-tool node 20.19.3
node --version
ExitOnNativeFailure

# renovate: datasource=dotnet packageName=dotnet-runtime
install-tool dotnet 8.0.17

# renovate: datasource=github-releases packageName=dotnet/docfx
install-tool docfx v2.78.3
docfx --version
ExitOnNativeFailure

# renovate: datasource=github-releases packageName=facebook/zstd
install-tool zstd v1.5.7

# renovate: datasource=github-releases packageName=minio/mc
install-tool minio-client RELEASE.2023-12-29T20-15-29Z

# install last to get latest vs updates
$env:VS_DOTNET_VERSIONS="6.0;8.0"
install-tool vs-tools

dotnet build test-cli
ExitOnNativeFailure
