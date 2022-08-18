Get-Service
Stop-Service
Start-Service

Get-Command Start-Service

Get-Command Start-Service | Select-Object *

Get-Command | Where-Object {$_.Definition -like "*whatif*"}

Get-Command | Where-Object {$_.Definition -like "*confirm*"}

Get-Command Get-Pr*



