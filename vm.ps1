Get-VM -computername hyperv

Get-VM VM1 -computername hyperv

Get-VM -computername hyperv | Select-Object *

Get-VM VM1 -computername hyperv | Select-Object VMName, Harddrives

Get-VM VM1 -computername hyperv | Select-Object VMName, -expandproperty Harddrives

Get-VM VM1 -computername hyperv | Select-Object -expandproperty Harddrives | Select-Object *

Get-VM VM1 -computername hyperv | Select-Object -expandproperty Harddrives | Select-Object  name, id 





