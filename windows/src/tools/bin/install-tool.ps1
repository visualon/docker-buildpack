#Requires -Version 5.1

[CmdletBinding()]
param (
  [Parameter(Mandatory = $true)]
  [string]
  $Name,

  [Parameter()]
  [string]
  $Version
)

$ErrorActionPreference = 'Stop'

. $PSScriptRoot\..\lib\index.ps1

if (-not $Version -and (Test-Path "env:\${Name}_version")) {
  $Version = Get-Content "env:\${Name}_version"
}

if ( $Version -like 'v*') {
  $Version = $Version.TrimStart('v')
}

"Installing Name " | Write-Host -ForegroundColor DarkGray -NoNewline
"$Name"  | Write-Host -ForegroundColor Green -NoNewline
if ($Version) {
  " v$Version" | Write-Host -ForegroundColor Yellow -NoNewline
}
" ... "  | Write-Host -ForegroundColor DarkGray

New-Item -Path $tmp -ItemType "directory" | Out-Null

if (Test-Path "${installer}\${Name}.ps1") {
  . "${installer}\${Name}.ps1"
}
elseif (Test-Path "${installer}\${Name}.cmd") {
  cmd /c "${installer}\${Name}.cmd"
  ExitOnNativeFailure
}
elseif (Test-Path "${installer}\${Name}.bat") {
  cmd /c "${installer}\${Name}.bat"
  ExitOnNativeFailure
}
else {
  throw "Missing Name installer"
}

Remove-Cache

" done." | Write-Host -ForegroundColor DarkGray
