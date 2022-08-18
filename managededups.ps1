#view volume settings
Get-DedupVolume

Get-DedupVolume R: | Format-List

#modify
Set-DedupVolume -Volume R: -MinimumFileAgeDays 0

#start a job manually
Start-DedupJob -type optimization -Volume R:, L:

#monitor status
Get-DedupJob

#monitor dedup status
Get-DedupStatus -volume R:, L:
Get-DedupStatus -Volume R: | Format-List

#disable dedup
Start-DedupJob -Type unoptimization -Volume R:, L: