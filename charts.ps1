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

$a = "<style>"
$a = $a + "BODY{background-color:DarkSeaGreen}"
$a = $a + "TABLE{border-width: 1px;padding: border-style: solid;border-color: black;border-collapse;}"
$a = $a + "TH{border-width: 1px;padding: 5px;border-style: solid;border-color: black:background-color:tan}"
$a = $a + "TD{border-width: 1px;padding: 5px;border-style: solid;border-color: black;background-color:WhiteSmoke}"
$a = $a + "<style>"

@($vms) | Display-Output | ConvertTo-Html -head $a -Body "<H2>Virtual CPU Information</H2>" | Out-File A:\cpuinfo.htm
 $vms
