#view sr-iov support
Get-VMHost | Format-List

#view sr-iov capabilities
Get-NetAdapterSriov

#view vmq capable nics
Get-NetAdapterVmq