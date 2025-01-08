#Requires -Version 5.1

if ( -not ($Version -match '^(\d+)\.(\d+)\.\d+$') ) {
  throw "Invalid $Name version"
}

$file = "$tmp\$Name.zip"
$major = $Matches.1
$minor = $Matches.2
$app = "$apps\$Name"

if ($major -gt 2 -or ($major -eq 2 -and $minor -ge 60)){
  $url = "https://github.com/dotnet/docfx/releases/download/v${Version}/docfx-win-x64-${Version}.zip"
} else {
  $url = "https://github.com/dotnet/docfx/releases/download/v$Version/docfx.zip"
}

Invoke-WebRequest $url -OutFile $file
Expand-Archive -Path $file -DestinationPath $app

Install-Shim -Name docfx -Path docfx.exe
