#view rrl settings
Get-DnsServerResponseRateLimiting

#configure rrl
Set-DnsServerResponseRateLimiting -ResponsesPerSec 2 -LeakRate 2 -TruncateRate 1 -mode logonly -Force

#enable rrl
Set-DnsServerResponseRateLimiting -mode enable -Force
Set-DnsServerResponseRateLimiting -mode disable -Force
#reset rrl to defaults
Set-DnsServerResponseRateLimiting -ResetToDefault -Force
