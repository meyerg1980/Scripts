Get-Process | Sort-Object CPU -Descending

Get-Process | Sort-Object CPU -Descending | Select-Object ProcessName, CPU -First 10

Get-Process | Where-Object {$_.Name -eq "svchost"}

$proc = Get-Process | Where-Object {$_.Name -eq "svchost"}
$proc.Count
