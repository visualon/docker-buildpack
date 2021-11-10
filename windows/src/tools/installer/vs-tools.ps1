#Requires -Version 5.1

Write-Debug "Fetching installer"
Invoke-WebRequest -OutFile c:\TEMP\vs_BuildTools.exe https://aka.ms/vs/17/release/vs_buildtools.exe

#curl -sSfLo c:\TEMP\collect.exe https://aka.ms/vscollect.exe

# https://docs.microsoft.com/en-us/visualstudio/install/workload-component-id-vs-build-tools?view=vs-2022
Write-Debug "Installing vs 2022 build tools"
exec {
  c:\TEMP\vs_buildtools.exe --quiet --wait --norestart --nocache `
    --installPath C:\BuildTools  `
		--add Microsoft.VisualStudio.Workload.MSBuildTools `
		--add Microsoft.VisualStudio.Workload.WebBuildTools  `
		--add Microsoft.VisualStudio.Workload.OfficeBuildTools  `
    --add Microsoft.NetCore.Component.Runtime.3.1 `
		--add Microsoft.NetCore.Component.Runtime.5.0 `
		--add Microsoft.NetCore.Component.Runtime.6.0 `
		--add Microsoft.NetCore.Component.SDK
} -AllowedExitCodes  @(0, 3010)

Write-Debug "Installing vs done"

if ($err = Get-ChildItem $Env:TEMP -Filter dd_setup_*_errors.log | Where-Object Length -gt 0 | Get-Content) {
  throw $err
}

Write-Debug "Configure env ..."
[Environment]::SetEnvironmentVariable("DOTNET_ROOT","${env:ProgramFiles}\dotnet", "Machine")
[Environment]::SetEnvironmentVariable("DOTNET_NOLOGO", "true", "Machine")
[Environment]::SetEnvironmentVariable("DOTNET_CLI_TELEMETRY_OPTOUT", "true", "Machine")
[Environment]::SetEnvironmentVariable("DOTNET_CLI_UI_LANGUAGE", "en-us", "Machine")
Write-Debug "Configure env done"

Write-Debug "Creating shims ..."
install-shim msbuild C:\BuildTools\MSBuild\Current\Bin\amd64\msbuild.exe
install-shim dotnet "${env:ProgramFiles}\dotnet\dotnet.exe"
#install-shim vswhere "${env:ProgramFiles(X86)}\Microsoft Visual Studio\Installer\vswhere.exe"
Write-Debug "Creating shims done"

Write-Debug "VS Test ..."
Get-ChildItem "${env:ProgramFiles}"
Get-ChildItem "${env:ProgramFiles(X86)}"
Get-ChildItem "${env:ProgramFiles}\dotnet"
dotnet nuget list source
exec { dotnet nuget list source } | Out-Null
Write-Debug "VS Test done"

Write-Debug "VS Cleanup ..."

$vsi = "${env:ProgramFiles(X86)}\Microsoft Visual Studio\Installer"
$vsi | Get-ChildItem -Directory | Remove-Item -Force -Recurse
$vsi | Get-ChildItem -File | Where-Object { $_.Name -ne 'vswhere.exe' } | Remove-Item -Force -Recurse

Write-Debug "VS Cleanup done"
