#adds in 3 verbose messages
[CmdletBinding()]
param (
[Parameter(Mandatory=$True)]
[Alias('hostname')]
[string]$computername,
[ValidateSet(2,3)]
[int]$drivetype = 3
)
Write-Verbose "Connecting to $computername"
Pause
Write-Verbose "Looking for drive type $drivetype"
Pause
Get-CimInstance -class Win32_LogicalDisk -ComputerName $computername `
-filter "drivetype=$drivetype" |
Sort-Object -property DeviceID |
Select-Object -property DeviceID,
@{name='FreeSpace(MB)';expression={$_.FreeSpace / 1MB -as [int]}},
@{name='Size(GB)';expression={$_.Size / 1GB -as [int]}},
@{name='%Free';expression={$_.FreeSpace / $_.Size * 100 -as [int]}}
Write-Verbose "Finished running command"