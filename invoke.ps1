$cred = Get-Credential
$session = New-PSSession -ComputerName fs1 -Credential $cred

Invoke-Command -Session $session -ScriptBlock {Get-VM | Select-Object Name, Get-VMHost}



#gather data from remote machine

$session = New-PSSession -ComputerName fs1
Invoke-Command -Session $session -ScriptBlock{
    $myvar = Get-VM
    $myvar | Select-Object Name
    Exit-PSSession
}

$myvar | Select-Object Name


#fix
$session = New-PSSession -ComputerName fs1
Invoke-Command -Session $session -ScriptBlock{
    $myvar = Get-VM
    $myvar | Select-Object Name
    Exit-PSSession
}
$localresult = Invoke-Command -Session $session -ScriptBlock {$myvar}
Exit-PSSession
$localresult | Select-Object Name