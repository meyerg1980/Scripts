Get-Process
Get-Command
Get-History -Count 10

Get-History

Get-Process | Export-Clixml -Path c:\export.xml
Get-ChildItem | Select-Object Name | Out-File process.txt

Get-Process | Export-Clixml reference.xml

Compare-Object -reference (Import-Clixml reference.xml) -Difference (Get-Process) -Property Name

$ConfirmPreference

Get-Process | Stop-Process -WhatIf

Get-Process | Select-Object -first 5 | export-csv .\process.csv -IncludeTypeInformation

get-content .\process.csv

Import-Csv .\process.csv

get-command | Export-Csv commands.csv | out-file -FilePath C:\test2.csv