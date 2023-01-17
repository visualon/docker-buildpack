#Requires -Version 5.1

$lib = $PSScriptRoot
. $lib\config.ps1
. $lib\shim.ps1
. $lib\exec.ps1
. $lib\cache.ps1


function set-dotnet-env {
  if($env:DOTNET_ROOT){
    Write-Debug "Env already configured"
    return;
  }
  Write-Debug "Configure env ..."
  [Environment]::SetEnvironmentVariable("DOTNET_ROOT", "${env:ProgramFiles}\dotnet", "Machine")
  [Environment]::SetEnvironmentVariable("DOTNET_NOLOGO", "true", "Machine")
  [Environment]::SetEnvironmentVariable("DOTNET_CLI_TELEMETRY_OPTOUT", "true", "Machine")
  [Environment]::SetEnvironmentVariable("DOTNET_CLI_UI_LANGUAGE", "en-us", "Machine")
  [Environment]::SetEnvironmentVariable("PATH", "${env:ProgramFiles}\dotnet;$([Environment]::GetEnvironmentVariable("PATH", "Machine"))", "Machine")
  Write-Debug "Configure env done"
}
