#Requires -Version 5.1

$ErrorActionPreference = 'Stop'
$DebugPreference = 'Continue'

. c:\tools\lib\exec.ps1

# renovate: datasource=github-releases lookupName=PowerShell/PowerShell
install-tool powershell v7.1.4
exec { pwsh --version }

# renovate: datasource=adoptium-java lookupName=java-jre
install-tool java 11.0.12+7
exec { java --version }

# renovate: datasource=node
install-tool node 14.17.6
exec { node --version }

# install last to get latest vs updates
install-tool vs-tools

exec { dotnet build test-cli }
