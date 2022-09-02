# use select-object instead of format-table for more flecxibilty to the end user
param (
$computername = 'localhost',
$drivetype = 3
)
Get-CimInstance -class Win32_LogicalDisk -ComputerName $computername `
-filter "drivetype=$drivetype" |
Sort-Object -property DeviceID |
Select-Object -property DeviceID,
@{label='FreeSpace(MB)';expression={$_.FreeSpace / 1MB -as [int]}},
@{label='Size(GB)';expression={$_.Size / 1GB -as [int]}},
@{label='%Free';expression={$_.FreeSpace / $_.Size * 100 -as [int]}}



#The [CmdletBinding()] must be the firstparam line after the comment-based help; PowerShell knows to look for it here.
[CmdletBinding()]
param (
$computername = 'localhost',
$drivetype = 3
)
Get-CimInstance -class Win32_LogicalDisk -ComputerName $computername `
-filter "drivetype=$drivetype" |
Sort-Object -property DeviceID |
Select-Object -property DeviceID,
@{name='FreeSpace(MB)';expression={$_.FreeSpace / 1MB -as [int]}},
@{name='Size(GB)';expression={$_.Size / 1GB -as [int]}},
@{name='%Free';expression={$_.FreeSpace / $_.Size * 100 -as [int]}}


#The [Parameter(Mandatory=$True)] decorator will make
#Get-DiskInventory -ComputerName SRV02 -drivetype 3
#PowerShell prompt for a computer name if whoever runs
#this script forgets to provide one.
[CmdletBinding()]
param (
[Parameter(Mandatory=$True)]
[string]$computername,

[Parameter(Mandatory=$True)]
[int]$drivetype = 3
)
Get-CimInstance -class Win32_LogicalDisk -ComputerName $computername `
-filter "drivetype=$drivetype" |
Sort-Object -property DeviceID |
Select-Object -property DeviceID,
@{name='FreeSpace(MB)';expression={$_.FreeSpace / 1MB -as [int]}},
@{name='Size(GB)';expression={$_.Size / 1GB -as [int]}},
@{name='%Free';expression={$_.FreeSpace / $_.Size * 100 -as [int]}}


[CmdletBinding()]
param (
[Parameter(Mandatory=$True)]
[Alias('host')]
[string]$computername,

[Parameter(Mandatory=$True)]
[int]$drivetype = 3
)
Get-CimInstance -class Win32_LogicalDisk -ComputerName $computername `
-filter "drivetype=$drivetype" |
Sort-Object -property DeviceID |
Select-Object -property DeviceID,
@{name='FreeSpace(MB)';expression={$_.FreeSpace / 1MB -as [int]}},
@{name='Size(GB)';expression={$_.Size / 1GB -as [int]}},
@{name='%Free';expression={$_.FreeSpace / $_.Size * 100 -as [int]}}



#We add [ValidateSet(2,3)] to the script to tell PowerShell that only two values, 2
#and 3, are accepted by our -drivetype parameter and that 3 is the default.
[CmdletBinding()]
param (
[Parameter(Mandatory=$True)]
[Alias('hostname')]
[string]$computername,

[ValidateSet(2,3)]
[int]$drivetype = 3
)
Get-CimInstance -class Win32_LogicalDisk -ComputerName $computername `
-filter "drivetype=$drivetype" |
Sort-Object -property DeviceID |
Select-Object -property DeviceID,
@{name='FreeSpace(MB)';expression={$_.FreeSpace / 1MB -as [int]}},
@{name='Size(GB)';expression={$_.Size / 1GB -as [int]}},
@{name='%Free';expression={$_.FreeSpace / $_.Size * 100 -as [int]}}


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
Write-Verbose "Looking for drive type $drivetype"
Get-CimInstance -class Win32_LogicalDisk -ComputerName $computername `
-filter "drivetype=$drivetype" |
Sort-Object -property DeviceID |
Select-Object -property DeviceID,
@{name='FreeSpace(MB)';expression={$_.FreeSpace / 1MB -as [int]}},
@{name='Size(GB)';expression={$_.Size / 1GB -as [int]}},
@{name='%Free';expression={$_.FreeSpace / $_.Size * 100 -as [int]}}
Write-Verbose "Finished running command"