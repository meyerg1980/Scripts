systeminfo.exe

Get-WindowsFeature *hyper-v*

Install-WindowsFeature -name hyper-v -IncludeManagementTools -Restart

Install-WindowsFeature -name rsat-hyper-v-tools, hyper-v-tools,hyper-v-powershell


Get-WindowsFeature *

Get-VM -ComputerName fs1

New-VM -ComputerName fs1 -Name vm1

New-VM -ComputerName fs1 -Name vm2 -Version 7.0

Update-VMVersion -ComputerName fs1 -name vm2

# enable nested virtualization
Set-VMProcessor -ComputerName fs1 -VMName vm1 -ExposeVirtualizationExtensions $true

#configure networking
Get-VMNetworkAdapter -ComputerName fs1 -VMName vm1 | Set-VMNetworkAdapter -MacAddressSpoofing on 

