Start-Job -ScriptBlock {gci}

Start-ThreadJob -ScriptBlock {gci}

invoke-command -ScriptBlock {Get-Process} -ComputerName (Get-Content .\servers.txt) -AsJob -JobName MyRemoteJob
invoke-command -ScriptBlock {Get-Process} -ComputerName dc -AsJob -JobName MyRemoteJob



Get-Job -Id 3 | format-list *

Receive-Job -id 3

Receive-Job -Name MyRemoteJob | Sort-Object PSComputerName | ft -GroupBy PSComputerName

Get-Job -id 5 | fl *

get-job | Where-Object {-not $_.HasMoreData} | Remove-Job

Start-ThreadJob -ScriptBlock {Get-ChildItem / -Recurse -filter '*.txt'}

invoke-command -ScriptBlock {Get-ChildItem / -Recurse -filter '*.txt'} -ComputerName dc -AsJob