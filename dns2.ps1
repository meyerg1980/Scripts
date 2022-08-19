#view all dns server cmdlets
Get-Command *dnsserver*

#create a primary forward and reverse lookup zone
add-dnsserverprimaryzone -name thisandthat.com -replicationscope domain
add-dnsserverprimaryzone -networkid "10.10.1.0/24" -replicationscope domain

#create resource records
add-dnsserverresourcerecord -a name ex-nug -ipv4address 10.10.10.100 -zonename thisandthat.com -createptr
add-dnsserverresourcerecorda -name web-nug -ipv4address 10.10.1.101 -zonename thisandthat.com -createptr
add-dnsserverresourcerecordcname -name www -zonename thisandthat.com -hostnamealias web-nug.thisandthat.com -preference 1
add-dnsserverresourcerecordmx -name mail -zonename thisandthat.com -mailexchange ex-nug.thisandthat.com -preference 1
add-dnsserverresourcerecord -srv -domainname www.thisandthat.com -name web -port 80 -priority 20 -weight 30 -zonename thisandthat.com          
get-dnsserverresourcerecord -zonename thisandthat.com

##configure secondary zone
add-dnsserverresecondaryzone -computername dns-nug -name thisandthat.com -masterservers 192.168.1.100 -zonefile "thisandthat.com.dns"

#configure zone transfers
set-dnsserverprimaryzone -name thisandthat.com -notifyservers "192.168.1.110" -secondaryservers "192.168.1.110" -securesecondaries transfertosecondaryzone

#enable scavenging 
Get-DnsClientServerscavenging 
Set-DnsClientServerscavenging -scavengingstate $true -applyonallzones

# test with pwsh
Resolve-DnsName www.thisandthat.com
Resolve-DnsName www.thisandthat.com -server dns-nug
Resolve-DnsName mail.thisandthat.com            

#test with cli
nslookup.exe www.thisandthat.com   
nslookup.exe www.thisandthat.com 192.168.1.110
nslookup.exe mail.thisandthat.com
