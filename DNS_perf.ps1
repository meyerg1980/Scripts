#create firewall rule for dns
New-NetFirewallRule -displayname "DNS (UDP)" -Direction inbound

#configure (or disable recursion)
get-dnsserverrecursion      
set-dnsserverrecursion -timeout 15 -retryinterval 5
set-dnsserverrecursion -enable $false

#configure cpu thread
Set-ItemProperty -path "HKLM:\SYSTEM\CurrentControlSet\Services\dns\parameters" -name "udprecvthreadcount" -value 8

#set net adapter buffers
Get-NetAdapterAdvancedProperty 
Set-NetAdapterAdvancedProperty -name "ethernet" -DisplayName "receive buffer size" -DisplayValue 16mb  
