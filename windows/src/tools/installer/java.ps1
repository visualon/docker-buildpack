#Requires -Version 5.1

$ErrorActionPreference = 'Stop'

. \tools\lib\index.ps1


$api = 'https://api.adoptium.net/v3/assets/version'
$apiArgs = 'heap_size=normal&image_type=jre&os=windows&page=0&page_size=1&project=jdk&vendor=adoptium&architecture=x64'

$url = "${api}/${Version}?${apiArgs}"

"Using api: $url" | Write-Host
$res = Invoke-RestMethod $url

$file = "$tmp\$Name.zip"
$app = "$apps\$Name"
$url = $res[0].binaries[0].package.link

Invoke-WebRequest $url -OutFile $file

New-Item -Path $app -ItemType "directory" | Out-Null

exec { tar -xzf $file -C $app --strip-components=1 }

Install-Shim -Name java -Path bin\java.exe
