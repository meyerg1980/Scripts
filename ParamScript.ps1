[cmdletbinding()]
param (
    [Parameter(Mandatory=$True,HelpMessage="Enter a computername to query")]
    [Alias('hostname')]
    [string]$computername
)
Write-Verbose "Getting NIC information for $computername"
Get-CimInstance win32_networkadapter -ComputerName $computername |
select MACAddress,AdapterType,DeviceID,Name,Speed
Write-Verbose "Script finished running"