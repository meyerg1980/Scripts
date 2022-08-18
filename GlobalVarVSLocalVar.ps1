function Get-Mydata {
    $myvar = Get-Process powershell
    Write-Host
    Write-Host "Function Output:"
    Write-Host
    $myvar
}

#script body

Get-Mydata
Write-Host
Write-Host "Script body output:"
Write-Host
$myvar


function Get-Mydata {
    $Global:myvar = Get-Process powershell
    Write-Host
    Write-Host "Function Output:"
    Write-Host
    $myvar
}

#script body

Get-Mydata
Write-Host
Write-Host "Script body output:"
Write-Host
$myvar




