#Requires -Version 5.1

Write-Debug "Fetching installer"
Invoke-WebRequest -OutFile c:\TEMP\vs_BuildTools.exe https://aka.ms/vs/17/release/vs_buildtools.exe

#curl -sSfLo c:\TEMP\collect.exe https://aka.ms/vscollect.exe

Write-Debug "Installing vs build tools"
exec {
  c:\TEMP\vs_buildtools.exe --quiet --wait --norestart --nocache `
    --installPath C:\BuildTools  `
    --add Microsoft.VisualStudio.Workload.WebBuildTools  `
    --add Microsoft.VisualStudio.Workload.OfficeBuildTools  `
    --add Microsoft.VisualStudio.Workload.NetCoreBuildTools `
    --add Microsoft.NetCore.Component.Runtime.5.0 | Out-Null
}  -AllowedExitCodes  @(0, 3010)

Write-Debug "Installing vs done"

if ($err = Get-ChildItem $Env:TEMP -Filter dd_setup_*_errors.log | Where-Object Length -gt 0 | Get-Content) {
  throw $err
}

[Environment]::SetEnvironmentVariable("DOTNET_ROOT","${env:ProgramFiles}\dotnet", "Machine")
[Environment]::SetEnvironmentVariable("DOTNET_NOLOGO", "true", "Machine")
[Environment]::SetEnvironmentVariable("DOTNET_CLI_TELEMETRY_OPTOUT", "true", "Machine")
[Environment]::SetEnvironmentVariable("DOTNET_CLI_UI_LANGUAGE", "en-us", "Machine")

install-shim msbuild C:\BuildTools\MSBuild\Current\Bin\amd64\msbuild.exe
install-shim dotnet ${env:ProgramFiles}\dotnet\dotnet.exe

Write-Debug "VS Test ..."
exec { dotnet nuget list source } | Out-Null
Write-Debug "VS Test done"

Write-Debug "VS Cleanup ..."

$vsi = "${env:ProgramFiles(X86)}\Microsoft Visual Studio\Installer"
$vsi | Get-ChildItem -Directory | Remove-Item -Force -Recurse
$vsi | Get-ChildItem -File | Where-Object { $_.Name -ne 'vswhere.exe' } | Remove-Item -Force -Recurse

Write-Debug "VS Cleanup done"
