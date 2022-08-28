#SSH setup
Add-WindowsCapability -online -Name OpenSSH.Client~~~~8.9.1.0
Add-WindowsCapability -online -Name OpenSSH.Server~~~~8.9.1.0

Start-Service sshd

Get-Process pwsh | Where-Object {$_.Parent.ProcessName -like '*term*'}
Invoke-command -HostName fs2,DC,server -ScriptBlock { Get-Process pwsh | Where-Object {$_.Parent.ProcessName -like '*term*'}}

Invoke-Command -ComputerName dc -ScriptBlock { Get-Process -name pwsh } | Stop-Process

Invoke-Command -ComputerName dc -ScriptBlock {{ Get-Process -name p

Get-Process | Sort-Object -Top 10 VirtualMemorySize

invoke-command -ComputerName dc, fs1 -ScriptBlock {get-process} | Sort-Object -Top 10 VirtualMemorySize

Invoke-Command -ScriptBlock {dir} -ComputerName (Get-Content .\servers.txt)

-ge (get-date).AddDays(-7)


invoke-command -ComputerName dc,fs1 -ScriptBlock $PSVersionTable 

$PSVersionTable | Where-Object Keys -Like "PSVersion"

$PSVersionTable | Select-Object PSVersion

($PSVersionTable).PSVersion