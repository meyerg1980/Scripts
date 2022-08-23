Install-Module -Name az

Get-Module az -ListAvailable

Register-PSRepository http://PowerShellGallery.com 

Install-Module PowerShellGet

Find-Module *scripttools*
Install-Module PSScriptTools

(Get-Content Env:/PSModulePath) -split ";"

Get-Module
Get-Module | Remove-Module

Get-PSRepository
Find-Module *google*
Install-Module -Name GoogleCloud
get-command -Name *-gcSqlinstance

#adds prefix to commands inn the module specified
Import-Module modulename -prefix MyPrefix 

$env:PSModulePath += [System.IO.Path]::PathSeparator + 'C:\Scripts/myModules'

help *-archive
help compress-archive

'test lunch' | out-file chapter7.txt
Compress-Archive -path ./chapter7.txt -DestinationPath ./chapter.zip
Compress-Archive -path ./chapter7.txt -DestinationPath ./chapter.zip -Verbose -Force

