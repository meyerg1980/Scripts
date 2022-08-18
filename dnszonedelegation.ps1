Get-DnsServerZoneDelegation
Add-DnsServerZoneDelegation
Set-DnsServerZoneDelegation
remove-serverzonedelegation

#view dns server settings
Get-DnsServer

#export, modify, import settings
Get-DnsServer | Export-Clixml -path "C:\dns-settings.xml"
$ds = Import-Clixml "C:\dns-settings.xml"
Set-DnsServer -inputobject $ds

#copy settings between dns servers
Get-DnsServer -cimsession -dc.meyerse.com | Set-DnsServer -computername cs.meyersec.com