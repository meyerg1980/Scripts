$psses = New-PSSession -Credential (get-credential)

$adses = New-PSSession -ComputerName dc   
Import-Module -name activedirectory -PSSession $adses
Get-Module

Install-Module windowscompatibility -scope CurrentUser

cd wsman\localhost\service\auth

Enter-PSSession fs1.meyersec.com -Authentication Credssp -Credential (get-credential)

#https
$options = New-PSSessionOption -SkipCACheck -SkipCNCheck -SkipRevocationCheck
Invoke-Command -ComputerName dc -ScriptBlock {$env:COMPUTERNAME} -UseSSL -SessionOption $options

#same as $var = something
Get-PSSession -OutVariable sess

#linux
invoke-command -hostname 192.168.1.13 -UserName greg -ScriptBlock {get-host}

#troubleshooting
Import-Module PSDiagnostics
get-command -module PSDiagnostics
Enable-PSWSManCombinedTrace

Invoke-Command -ComputerName dc -ScriptBlock {Get-Process}
Disable-PSWSManCombinedTrace
