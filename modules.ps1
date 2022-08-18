$A = Get-Command 

$A.Count

Get-Module
Remove-Module hyperv
Import-Module hyperv

Get-Command | Where-Object {$_.Source -eq hyperv}

Get-Process | Where-Object {$_.Name -eq "Powershell"}



