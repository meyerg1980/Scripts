#add nics
Add-VMNetworkAdapter -ComputerName fs1 -VMName base -SwitchName vInternal -Name InternalNIC
Add-VMNetworkAdapter -ComputerName fs1 -VMName vm2 -SwitchName vInternal -name InternalNIC

#remove nics
Get-VM -ComputerName fs1 | Remove-VMNetworkAdapter -Name "Network Adapter"

#mac address
Set-VMHost -MacAddressMinimum 00155d01d600 -MacAddressMaximum 00155d01d6ff

Get-VM |
    Get-VMNetworkAdapter |
        Format-Table VMName, -MacAddress