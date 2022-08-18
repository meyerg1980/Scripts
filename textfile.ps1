function Display-Output ($VM, $CPU)
{
    $obj = New-Object psobject
    $obj | Add-Member NoteProperty "VM Name" ($VM.Name)
    $VM.Name | Add-Content A:\morevminfo.txt
    $obj | Add-Member NoteProperty "CPU Count"($CPU.Count)
    $CPU.Count | Add-Content A:\morevminfo.txt
    $obj | Add-Member NoteProperty "Maximum" ($CPU.Maximum)
    $CPU.Maximum | Add-Content A:\morevminfo.txt
    $obj | Add-Member NoteProperty "Reserve" ($CPU.Reserve)
    $CPU.Reserve | Add-Content A:\morevminfo.txt
    Write-Output $obj | Add-Content A:\morevminfo.txt
}

$A = $null
$A | Out-File A:\morevminfo.txt
$vms = Get-VM
foreach ($vm in $vms)
{
    $CPU = Get-VMProcessor $vm.Name
    Display-Output $vm $CPU 
}