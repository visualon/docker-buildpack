#Requires -Version 5.1

if ( -not ($Version -match '^(\d+)$') ) {
  throw "Invalid $Name version"
}

Write-Debug "Downloading installer ..."
Invoke-WebRequest -OutFile "$tmp\vc_redist.exe" https://aka.ms/vc$Version/vc_redist.x64.exe
Write-Debug "Downloading installer done"

Write-Debug "Installing vc redist"
$vsArgs = @(
  "/install", "/quiet", "/norestart"
)
$vsProcess = Start-Process "$tmp\vc_redist.exe" -ArgumentList $vsArgs -Wait -PassThru -NoNewWindow

if ($vsProcess.ExitCode -notin @(0, 3010)) {
  throw "Install failed."
}

Write-Debug "Installing vc redist done"
