#view adapter vlan settings
get=Add-VMNetworkAdaptervlan -VMName base | Format-List

#configure vlan adapter in trunk mode
Set-VMNetworkAdapterVlan -VMName base -AllowedVlanIdList 20-30 -NativeVlanId 1 -Trunk