$A = 8
$B = 8

if ($A -eq $B) {Write-Host "They are the same"}

$A = "Hello World"
$A -match "World"
$A -notmatch "World"

$A -replace "World", "Everyone"

$B = $A -replace "World", "Everyone"

$A = "PowerShell"

$A -contains "Shell"
#false

$A -notcontains "Shell"
#true



