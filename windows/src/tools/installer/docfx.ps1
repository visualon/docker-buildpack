#Requires -Version 5.1

if ( -not ($Version -match '^(\d+)\.(\d+)\.(\d+)$') ) {
  throw "Invalid $Name version"
}

$file = "$tmp\$Name.zip"
$app = "$apps\$Name"
$ver = [version] $Version
if ($ver -eq [version]"2.78.1" -or $ver -eq [version]"2.78.2") {
  $url = "https://github.com/dotnet/docfx/releases/download/v${Version}/docfx-win-x64-${Version}.zip"
}
elseif ($ver -ge [version]"2.60") {
  $url = "https://github.com/dotnet/docfx/releases/download/v${Version}/docfx-win-x64-v${Version}.zip"
}
else {
  $url = "https://github.com/dotnet/docfx/releases/download/v$Version/docfx.zip"
}

Invoke-WebRequest $url -OutFile $file
Expand-Archive -Path $file -DestinationPath $app

Install-Shim -Name docfx -Path docfx.exe
