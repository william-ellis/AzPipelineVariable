[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [string]$Path
)

$manifest = Import-PowerShellDataFile $Path

$version = $manifest.ModuleVersion
$prerelease = $manifest.PrivateData.PSData.Prerelease

[string]::IsNullOrEmpty($prerelease) ? "$version" : "$version-$prerelease"
