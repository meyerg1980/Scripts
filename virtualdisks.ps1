#create fixed vhd 
New-VHD -Path A:\vhd\fixed.vhd -Fixed -SizeBytes 50gb

#create a dynamic vhd
new-vhd -Path A:\vhd\dynamic.vhdx -Dynamic -SizeBytes 500gb

#create, mount, initialize and format dynamic vhdx
new-vhd -Path "A:\vhd\storage.vhdx" -Dynamic -SizeBytes 500gb |
    Mount-VHD -Passthru |
        Initialize-Disk -passthru |
            New-Partition -assigndriveletter -usemaximumsize |
                Format-Volume -filesystem ntfs -force


#differencing disk
New-VHD -Path "A:\vhd\vm1.vhdx" -ParentPath "A:\vhd\base.vhdx" -Differencing

New-VM -Name vm2 -Generation 2 -VHDPath "A:\vhd\vm1.vhdx" -MemoryStartupBytes 2gb -SwitchName vExternal

Start-VM -Name vm1


#pass-through disks
