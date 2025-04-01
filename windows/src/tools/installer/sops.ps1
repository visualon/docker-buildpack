#Requires -Version 5.1

$app = "$apps/$Name"
$file = "$app/sops.exe"
$fileName = "sops-v$Version.exe"
$ver = [version] $Version

if ($ver -ge [version]"3.10.0") {
  $fileName = "sops-v$Version.amd64.exe"
}

$url = "https://github.com/getsops/sops/releases/download/v$Version/$fileName"

New-Item -ItemType Directory $app | Out-Null

Invoke-WebRequest $url -OutFile $file

Install-Shim -Name sops -Path sops.exe

sops --version
ExitOnNativeFailure
