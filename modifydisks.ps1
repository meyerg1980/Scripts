#view virtual harddisk propertiess
Get-VHD -Path "a:\vhd\vm1.vhdx"

#resize virtual harddisk
Resize-VHD -Path "a:\vhd\vm1.vhdx" -SizeBytes 100gb

Resize-VHD -Path "a:\vhd\vm1.vhdx" -SizeBytes -ToMinimumSize

Get-Command *vhd*

