#Requires -Version 5.1

$ErrorActionPreference = 'Stop'
$DebugPreference = 'Continue'

. c:\tools\lib\exec.ps1

# renovate: datasource=github-releases lookupName=PowerShell/PowerShell
install-tool powershell v7.1.4
exec { pwsh --version }

# renovate: datasource=adoptium-java lookupName=java-jre
install-tool java 11.0.16+8
exec { java --version }

# renovate: datasource=node
install-tool node 14.20.0
exec { node --version }

# renovate: datasource=github-releases lookupName=dotnet/docfx
install-tool docfx v2.59.3
exec { docfx --version }

# renovate: datasource=github-releases lookupName=facebook/zstd
install-tool zstd 1.5.2

# renovate: datasource=github-releases lookupName=minio/mc
install-tool minio-client RELEASE.2022-07-24T02-25-13Z

# install last to get latest vs updates
install-tool vs-tools

exec { dotnet build test-cli }
