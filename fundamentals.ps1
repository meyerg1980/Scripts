dir | Sort-Object -Descending -Property LastWriteTime


#not sure what this is
dir | foreach {
    "$($_.GetType().FullName) - $_.Name"
}


Get-Module -ListAvailable

Get-Alias dir

Get-PSDrive

cd env:
cd hkcu:

New-Item -ItemType Directory -Path a:\PowershellMC

git clone gh repo clone johnthebrit/PowerShellMC

git pull
