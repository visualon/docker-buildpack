#Requires -Version 5.1

# mc.RELEASE.2022-05-04T06-07-55Z
# if ( -not ($Version -match '^(\d+\.\d+\.\d+)$') ) {
#   throw "Invalid $Name version"
# }

$app = "$apps/$Name"
$file = "$app/mc.exe"
$url = "https://github.com/minio/mc/releases/download/$Version/mc.windows-amd64.$Version.exe"

New-Item -ItemType Directory $app | Out-Null

Invoke-WebRequest $url -OutFile $file

Install-Shim -Name mc -Path mc.exe -Tool $Name

mc --version
ExitOnNativeFailure
