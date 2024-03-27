#Requires -Version 5.1

$app = "$apps/$Name"
$file = "$app/sops.exe"
$url = "https://github.com/getsops/sops/releases/download/v$Version/sops-v$Version.exe"

New-Item -ItemType Directory $app | Out-Null

Invoke-WebRequest $url -OutFile $file

Install-Shim -Name sops -Path sops.exe

sops --version
ExitOnNativeFailure
