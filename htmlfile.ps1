function Display-Output ($VM, $CPU)
{
Process{
    $obj = New-Object psobject
    $obj | Add-Member NoteProperty "VM Name" ($_.Name)
    $CPU = Get-VMProcessor ($_.Name)
    $obj | Add-Member NoteProperty "CPU Count"($CPU.Count)
    $obj | Add-Member NoteProperty "Maximum" ($CPU.Maximum)
    $obj | Add-Member NoteProperty "Reserve" ($CPU.Reserve)
    Write-Output $obj
}
}
$vms = Get-VM
@($vms) | Display-Output | ConvertTo-Html | Out-File A:\moremoreinfo.html