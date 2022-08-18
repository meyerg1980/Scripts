#configure checkpoint
set-vm -Name vm1 -CheckpointType productiononly

#create checkpoint
Checkpoint-VM -Name vm1 -SnapshotName base

#create another checkpoint
Checkpoint-VM -Name vm1 -SnapshotName iisinstalled

#create yet another checkpoint
Checkpoint-VM -Name vm1 -SnapshotName iisconfigure

#restore checkpoint
Restore-VMSnapshot -VMName -Name isinstalled

