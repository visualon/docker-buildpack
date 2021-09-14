#Requires -Version 5.1

$ErrorActionPreference = 'Stop'

# renovate: datasource=github-releases lookupName=PowerShell/PowerShell
install-tool pwsh v7.1.4

# renovate: datasource=adoptium-java lookupName=java-jre
install-tool java 11.0.12+7

# renovate: datasource=node
$NODE_VERSION=14.17.6
install-tool node $NODE_VERSION
