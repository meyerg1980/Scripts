new-pssession -computername srv02,dc17,print99
new-pssession -hostname LinuxWeb01,srv03
get-pssession


$iis_servers = new-pssession -computername web01,web02,web03 -credential WebAdmin

$web_servers = new-pssession -hostname web04,web05,web06 -username WebAdmin

$iis_servers | remove-pssession

get-pssession | remove-pssession

#multiple sessions, one command
$s_server1,$s_server2 = new-pssession -computer server,dc

#doesn't work
$session01 = New-PSSession -computername server

$session02 = New-PSSession -hostname linux01,linux02 -keyfilepath {path to key file}

enter-pssession $session01

Enter-PSSession -Session $session01

$session01 | gm

enter-pssession -session ($sessions | where { $_.computername -eq 'server' })

enter-pssession -session (get-pssession -computer server)

Get-PSSession -ComputerName server | Enter-PSSession

invoke-command -command { Get-Process } -session $session01

invoke-command -command { get-process bits } -session (get-pssession -ComputerName server,dc)

$session = new-pssession -ComputerName dc
invoke-command -command { import-module activedirectory } -Session $session

import-pssession -session $session -module activedirectory -prefix rem

Get-PSSession -ComputerName server

#reconnect disconnected session where powershell is still up on remote comp
Get-PSSession -computerName dc | Connect-PSSession

Get-EventLog -LogName  Security | Select-Object -First 20 

invoke-command -command {Get-EventLog -LogName security | Select-Object -First 20} -Session $session

invoke-command -command {ServerManagerLauncher.exe} -Session $session

invoke-command -ComputerName dc,fs1,gns3 {get-eventlog -Newest 3}