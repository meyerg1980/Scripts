#Get-DiskInventory script
Get-CimInstance -class Win32_LogicalDisk -computername localhost `
-filter "drivetype=3" | Sort-Object -property DeviceID |
Format-Table -property DeviceID,
@{label='FreeSpace(MB)';expression={$_.FreeSpace / 1MB -as [int]}},
@{label='Size(GB)';expression={$_.Size / 1GB -as [int]}},
@{label='%Free';expression={$_.FreeSpace / $_.Size * 100 -as [int]}}

$computername = read-host 'Enter computer name'
Get-CimInstance -class Win32_LogicalDisk -computername $computername `
-filter "drivetype=3" | Sort-Object -property DeviceID |
Format-Table -property DeviceID,
@{label='FreeSpace(MB)';expression={$_.FreeSpace / 1MB -as [int]}},
@{label='Size(GB)';expression={$_.Size / 1GB -as [int]}},
@{label='%Free';expression={$_.FreeSpace / $_.Size * 100 -as [int]}}

$filePath = 'C:\Users\gmeyer80\Documents'
get-childitem -path $filepath | get-filehash |
Sort-Object hash | Select-Object -first 10

#run with parameter
param (
$computername = 'localhost'
)
Get-CimInstance -class Win32_LogicalDisk -computername $computername `
-filter "drivetype=3" |
Sort-Object -property DeviceID |
Format-Table -property DeviceID,
@{label='FreeSpace(MB)';expression={$_.FreeSpace / 1MB -as [int]}},
@{label='Size(GB';expression={$_.Size / 1GB -as [int]}},
@{label='%Free';expression={$_.FreeSpace / $_.Size * 100 -as [int]}}

#additional parameters
param (
[string]$computername = 'localhost',
[int]$drivetype = 3
)
Get-CimInstance -class Win32_LogicalDisk -computername $computername `
-filter "drivetype=$drivetype" |
Sort-Object -property DeviceID |
Format-Table -property DeviceID,
@{label='FreeSpace(MB)';expression={$_.FreeSpace / 1MB -as [int]}},
@{label='Size(GB';expression={$_.Size / 1GB -as [int]}},
@{label='%Free';expression={$_.FreeSpace / $_.Size * 100 -as [int]}}


param (
    $computername = "localhost",
    $minspace = .1
)
Get-CimInstance -classname Win32_LogicalDisk -ComputerName $computername `
-filter "drivetype=3" |
Where { ($_.FreeSpace / $_.Size) -lt $minspace } |
Select -Property DeviceID,FreeSpace,Size


Get-ADComputer -filter * | Select-Object -Property name, {name='ComputerName';expression={$_.name}} | gm

Import-PSSession -Session $s -Module ActiveDirectory -Prefix remote