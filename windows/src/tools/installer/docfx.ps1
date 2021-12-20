#Requires -Version 5.1

if ( -not ($Version -match '^(\d+\.\d+\.\d+)$') ) {
  throw "Invalid $Name version"
}


$file = "$tmp\$Name.zip"
$app = "$apps\$Name"
$url = "https://github.com/dotnet/docfx/releases/download/v$Version/docfx.zip"

Invoke-WebRequest $url -OutFile $file

Expand-Archive -Path $file -DestinationPath $app

Install-Shim -Name docfx -Path docfx.exe
