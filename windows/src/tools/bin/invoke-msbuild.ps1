#Requires -Version 5.1

Param(
    [Parameter(Mandatory = $true, Position = 1)]
    [Alias("p", "proj")]
    [String] $Project,
    [Alias("t", "tgt")]
    [String] $Target = 'Build',
    [Alias("v")]
    [String] $Verbosity = 'm',
    [Alias("props")]
    [String] $Properties = ''
)

$ErrorActionPreference = 'Stop'

. $PSScriptRoot\..\lib\index.ps1

$opts = @("$Project", '/nologo', "/t:$Target", "/m", "/v:$Verbosity", '/nodeReuse:false')

if ($Properties -ne $null -and $Properties -ne '') {
    $opts += ('/p:' + $Properties + '')
}

& msbuild $opts
ExitOnNativeFailure
