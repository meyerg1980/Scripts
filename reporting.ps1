Get-ADUser gmeyer80 | Select-Object *

Get-VM -ComputerName fs1 -VMName Base | Select-Object *

Get-VM -ComputerName fs1 -VMName Base | Select-Object Name, State

Start-VM -ComputerName fs1 -VMName Base

Get-VM -ComputerName fs1 | Where-Object {$_.State -eq "Running"}

Get-VM -ComputerName fs1 | Where-Object {$_.State -eq "Off"}

function Display-Output ($VM, $CPU)
{
    $obj = New-Object psobject
    $obj | Add-Member NoteProperty "VM Name" ($VM.Name)
    $obj | Add-Member NoteProperty "CPU Count"($CPU.Count)
    $obj | Add-Member NoteProperty "Maximum" ($CPU.Maximum)
    $obj | Add-Member NoteProperty "Reserve" ($CPU.Reserve)
    Write-Output $obj
}

$vms = Get-VM
foreach ($vm in $vms)
{
    $CPU = Get-VMProcessor $vm.Name
    Display-Output $vm $CPU
}