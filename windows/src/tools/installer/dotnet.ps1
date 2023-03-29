#Requires -Version 5.1

if ( -not ($Version -match '^\d+\.\d+\.\d+$') ) {
  throw "Invalid $Name version"
}

# https://github.com/dotnet/dotnet-docker/blob/880d08740957aa10aa153fc2646f10b18569f143/src/runtime/6.0/windowsservercore-ltsc2022/amd64/Dockerfile#L14

$app = "${Env:ProgramFiles}\dotnet"

$file = "$tmp\$Name.zip"
$url = "https://dotnetcli.azureedge.net/dotnet/Runtime/$Version/dotnet-runtime-$Version-win-x64.zip"

Invoke-WebRequest $url -OutFile $file
New-Item $app -ItemType Directory | Out-Null
tar -oxzf $file -C $app
ExitOnNativeFailure

set-dotnet-env

Install-Shim -Name dotnet -Path "$app\dotnet.exe"

dotnet --info
ExitOnNativeFailure
