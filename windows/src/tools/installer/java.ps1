#Requires -Version 5.1

$ErrorActionPreference = 'Stop'

# 11.0.12+7
# 17.0.9+9.1
# 21.0.1+12.1.LTS
if ( -not ($Version -match '^(?<version>\d+\.\d+\.\d+)(?:\+(?<meta>\d+(?:\.\d+(?:\.LTS)?)?))?$') ) {
  throw "Invalid $Name version"
}

$api = 'https://api.adoptium.net/v3/assets/version'
$apiArgs = 'heap_size=normal&image_type=jre&os=windows&page=0&page_size=1&project=jdk&architecture=x64&semver=true'

$url = "${api}/${Version}?${apiArgs}"

$res = Invoke-RestMethod $url

$file = "$tmp\$Name.zip"
$app = "$apps\$Name"
$url = $res[0].binaries[0].package.link

Invoke-WebRequest $url -OutFile $file

New-Item -Path $app -ItemType 'directory' | Out-Null

tar -xzf $file -C $app --strip-components=1
ExitOnNativeFailure

Install-Shim -Name java -Path bin\java.exe
