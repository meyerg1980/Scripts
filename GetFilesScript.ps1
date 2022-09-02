[CmdletBinding()]
param (
    [parameter(Mandatory=$true)]
    [string]$filePath
)
Write-Verbose "Scanning file system"
$filePath = 'C:\Share1\Scripts'
get-childitem -path $filepath -Recurse -Force |
Select-Object -first 10
Write-Verbose "All done Chuck!"