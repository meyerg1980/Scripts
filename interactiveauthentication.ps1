Get-Credential 

$Cred = Get-Credential

Enter-PSSession -ComputerName DC -Credential $Cred

Exit-PSSession

