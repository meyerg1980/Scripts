# view nic properties
Get-VMNetworkAdapter -ComputerName fs1 -VMName base | Format-List

#configure bandwidth range
Set-VMNetworkAdapter -ComputerName fs1 -VMName base -MinimumBandwidthWeight 40
Set-VMNetworkAdapter -ComputerName fs1 -VMName vm2 -MinimumBandwidthWeight 60
