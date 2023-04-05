#Requires -Version 5.1

$ErrorActionPreference = 'Stop'
$DebugPreference = 'Continue'

. c:\tools\lib\exec.ps1

# renovate: datasource=github-releases packageName=PowerShell/PowerShell
install-tool powershell v7.3.3
pwsh --version
ExitOnNativeFailure

# renovate: datasource=adoptium-java packageName=java-jre
install-tool java 11.0.18+10
java --version
ExitOnNativeFailure

# renovate: datasource=node
install-tool node 18.15.0
node --version
ExitOnNativeFailure

# renovate: datasource=dotnet packageName=dotnet-runtime
install-tool dotnet 6.0.15

# renovate: datasource=github-releases packageName=dotnet/docfx
install-tool docfx v2.59.4
docfx --version
ExitOnNativeFailure

# renovate: datasource=github-releases packageName=facebook/zstd
install-tool zstd v1.5.5

# renovate: datasource=github-releases packageName=minio/mc
install-tool minio-client RELEASE.2023-03-23T20-03-04Z

# install last to get latest vs updates
install-tool vs-tools

dotnet build test-cli
ExitOnNativeFailure
