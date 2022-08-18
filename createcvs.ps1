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
    Display-Output $vm $CPU | Export-Csv -Path A:\vmdisplay.csv -NoTypeInformation -Append
}