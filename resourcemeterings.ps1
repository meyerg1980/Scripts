#enable and verify resource metering
Get-VM | Disable-VMResourceMetering
Get-VM | Format-Table Name, Resourcemeteringenabled

#view default statistics
Get-VM | Measure-VM

#view all stats for a vm
Get-VM fs1 | Measure-VM | Format-List *

#view detailed disk stats
(Measure-VM -VMName vm1).harddiskmetrics  

#configure collection interval
Get-VMHost | Format-List *
Get-VMHost | -resourcemeteringinterval 02:00:00

#view resource pools 
Get-VMResourcePool -name pool -ResourcePoolType @("Memory","Processor")

# view aggregated stats
Get-VMRemoteFx3dVideoAdapter -Name pool | Measure-VMResourcePool
