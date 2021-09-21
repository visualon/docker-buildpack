#Requires -Version 5.1

$ErrorActionPreference = 'Stop'

# renovate: datasource=github-releases lookupName=PowerShell/PowerShell
install-tool pwsh v7.1.4

# renovate: datasource=adoptium-java lookupName=java-jre
install-tool java 11.0.12+7

# renovate: datasource=node
install-tool node 14.17.6

# renovate: datasource=github-releases lookupName=msys2/msys2-installer
install-tool msys2 2021-07-25
