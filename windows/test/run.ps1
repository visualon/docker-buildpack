#Requires -Version 5.1

$ErrorActionPreference = 'Stop'
$DebugPreference = 'Continue'

. c:\tools\lib\exec.ps1

# renovate: datasource=github-releases lookupName=PowerShell/PowerShell
install-tool powershell v7.3.1
exec { pwsh --version }

# renovate: datasource=adoptium-java lookupName=java-jre
install-tool java 11.0.18+10
exec { java --version }

# renovate: datasource=node
install-tool node 14.21.2
exec { node --version }

# renovate: datasource=dotnet
install-tool dotnet 6.0.13

# renovate: datasource=github-releases lookupName=dotnet/docfx
install-tool docfx v2.59.4
exec { docfx --version }

# renovate: datasource=github-releases lookupName=facebook/zstd
install-tool zstd 1.5.2

# renovate: datasource=github-releases lookupName=minio/mc
install-tool minio-client RELEASE.2023-01-28T20-29-38Z

# install last to get latest vs updates
install-tool vs-tools

exec { dotnet build test-cli }
