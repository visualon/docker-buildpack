#Requires -Version 5.1

# mc.RELEASE.2022-05-04T06-07-55Z
# if ( -not ($Version -match '^(\d+\.\d+\.\d+)$') ) {
#   throw "Invalid $Name version"
# }

$app = "$apps/$Name"
$file = "$app/mc.exe"
$url = "https://dl.minio.io/client/mc/release/windows-amd64/archive/mc.$Version"

New-Item -ItemType Directory $app | Out-Null

Invoke-WebRequest $url -OutFile $file


Install-Shim -Name mc -Path mc.exe -Tool $Name

exec { mc --version }
