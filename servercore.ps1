Get-NetIPInterface

New-NetIPAddress - interfaceindex 4 -IPAddress 192.168.1.106 -PrefixLength 24 -DefaultGateway 192.168.1.1

Set-DnsClientServerAddress -InterfaceIndex 4  -ServerAddresses ("192.168.1.1, 208.67.220.220")

Rename-Computer -NewName core1 -Restart

add-computer -domain "meyersec.com" -Credential (Get-Credential) -restart 

Get-NetFirewallProfile   

Set-NetFirewallProfile -Profile Domain, public, private -Enabled false 

Get-WindowsFeature
Install-WindowsFeature web-server -IncludeManagementTool

wmic nicconfig get caption,index,tcpipnetbiosoptions