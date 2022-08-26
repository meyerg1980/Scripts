help *yaml* #nothing

Get-Command -Noun *yaml* #nothing

Find-Module *yaml* #bingo

Install-Module powershell-yaml

Get-Command -Module powershell-yaml | Format-Table -AutoSize

help ConvertFrom-Yaml 
help ConvertTo-Yaml

Get-Content -Raw .\credscan.yml

Get-Content -Raw .\credscan.yml | ConvertFrom-Yaml

help *json*

Get-Content -Raw .\credscan.yml | ConvertFrom-Yaml | ConvertTo-Json -Depth 100



