#create new forward lookup zone
Add-DnsServerPrimaryZone -name "lbpolicy.com" -ReplicationScope domain   

#create scopes within zpne
add-dnsserverzonescope -ZoneName "lbpolicy.com" -Name "lightweight"
add-dnsserverzonescope -ZoneName "lbpolicy.com" -Name "heavyweight"

#create resource records
Add-DnsServerResourceRecord -ZoneName "lbpolicy.com" -A -Name "www" -IPv4Address "192.168.1.11"
Add-DnsServerResourceRecord -ZoneName "lbpolicy.com" -A -Name "www" -IPv4Address "192.168.1.22" -ZoneScope "lightweight"
Add-DnsServerResourceRecord -ZoneName "lbpolicy.com" -A -Name "www" -IPv4Address "192.168.1.22" -ZoneScope "heavytweight"

#create query resolution policy
Add-DnsServerQueryResolutionPolicy -Name "lbpolicy" -Action allow -fqdn "EQ,*" -ZoneScope "lbpolicy,1;lightweight,1;heavyweight" -ZoneName "lbpolicy"

