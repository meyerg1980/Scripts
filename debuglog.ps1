Get-Content "nsdebuglog.log" |
Where-Object {$_ -match '\d{4}/\d{2}/\d{2} \d{2}:\d{2}:\d{2}\.\d{6}.*nsTunnel DTLS.*Tunneling flow from addr.*process: ([^,]*)'} |
ForEach-Object {$matches[1]} |
Group-Object |
Select-Object Name, Count