#create qos policy
new-storageqospolicy -name vmqospolicy -minimumiops 10 -maximumiops 100

#assign qos policy to all disks for every virtual machine
Get-VM |
    Get-VMHardDiskDrive |
        Set-VMHardDiskDrive -QoSPolicyID (get-storageqospolicy -name vmqospolicy).policyid
