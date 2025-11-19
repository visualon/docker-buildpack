#Requires -Version 5.1

Write-Debug "Downloading installer ..."
Invoke-WebRequest -OutFile "$tmp\vs_BuildTools.exe" https://aka.ms/vs/stable/vs_BuildTools.exe
Write-Debug "Downloading installer done"
#curl -sSfLo c:\TEMP\collect.exe https://aka.ms/vscollect.exe

# https://learn.microsoft.com/en-us/visualstudio/install/workload-component-id-vs-build-tools?view=visualstudio
Write-Debug "Installing vs stable build tools"
$vsArgs = @(
  "--quiet", "--wait", "--norestart", "--nocache",
  "--installPath", "C:\BuildTools",
  "--add", "Microsoft.VisualStudio.Workload.MSBuildTools",
  "--add", "Microsoft.VisualStudio.Workload.OfficeBuildTools",
  "--add", "Microsoft.VisualStudio.Workload.WebBuildTools"
)

$dotnetVersions = @()

if ($env:VS_DOTNET_VERSIONS){
  $dotnetVersions = $env:VS_DOTNET_VERSIONS.Split(";")
}

foreach ($version in $dotnetVersions) {
  Write-Debug "Adding dotnet $version"
  $vsArgs += "--add", "Microsoft.NetCore.Component.Runtime.$version"
}

$vsProcess = Start-Process "$tmp\vs_buildtools.exe" -ArgumentList $vsArgs -Wait -PassThru -NoNewWindow

if ($vsProcess.ExitCode -notin @(0, 3010)) {
  throw "Install failed."
}

if ($err = Get-ChildItem $Env:TEMP -Filter dd_setup_*_errors.log | Where-Object Length -gt 0 | Get-Content) {
  throw $err
}
Write-Debug "Installing vs done"

set-dotnet-env

Write-Debug "Creating shims ..."
install-shim msbuild C:\BuildTools\MSBuild\Current\Bin\amd64\msbuild.exe
install-shim dotnet "${env:ProgramFiles}\dotnet\dotnet.exe"
# install-shim vswhere "${env:ProgramFiles(X86)}\Microsoft Visual Studio\Installer\vswhere.exe"
Write-Debug "Creating shims done"

Write-Debug "VS Test ..."
dotnet nuget list source | Out-Null
ExitOnNativeFailure
Write-Debug "VS Test done"

Write-Debug "VS Cleanup ..."

$vsi = "${env:ProgramFiles(X86)}\Microsoft Visual Studio\Installer"
$vsi | Get-ChildItem -Directory | Remove-Item -Force -Recurse
$vsi | Get-ChildItem -File | Where-Object { $_.Name -ne 'vswhere.exe' } | Remove-Item -Force -Recurse

Write-Debug "VS Cleanup done"
