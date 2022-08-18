#install data deduplication
Install-WindowsFeature -Name fs-file-server,fs-data-deduplication

#enable dedup
Enable-DedupVolume -Volume L: -UsageType default

#view job schedules
Get-DedupSchedule

#create new schedule for optim
New-DedupSchedule -name optimizeoften -type optimization -DurationHours 6 -start 12:00 -Memory 20 -Cores 20 -Priority normal

#disable the default optim
Set-DedupSchedule -Name backgroundoptimization -enabled $false
