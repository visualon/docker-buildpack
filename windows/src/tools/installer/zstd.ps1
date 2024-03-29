#Requires -Version 5.1

# 1.14.5
if ( -not ($Version -match '^(\d+\.\d+\.\d+)$') ) {
  throw "Invalid $Name version"
}

$file = "$tmp\$Name.zip"
$url = "https://github.com/facebook/zstd/releases/download/v$Version/zstd-v$Version-win64.zip"

Invoke-WebRequest $url -OutFile $file

Expand-Archive -Path $file -DestinationPath c:\TEMP

if (Test-Path "$tmp/zstd-v$Version-win64/zstd.exe") {
  Move-Item -Path "$tmp/zstd-v$Version-win64/zstd.exe" -Destination $bin
}
elseif (Test-Path "$tmp/zstd.exe") {
  Move-Item -Path "$tmp/zstd.exe" -Destination $bin
}

zstd --version
ExitOnNativeFailure
