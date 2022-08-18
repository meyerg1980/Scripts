#install storage replica on both member servers
$cred = get-credential
invoke-Command -ComputerName fs1 -ScriptBlock {Install-WindowsFeature -Name storage-replica,rsat-storage-replica}

#create storage replica partnership
New-srpartnership -sourcecomputername fs1  -sourcergname fs1 -sourcevolumename R: -sourcelogvolume L:
              -destinationcomputername fs2  -destinationrgname fs2   -destinationvolumename R:  -destinationlogvolume L:

#view config
Get-srgroup 

#monitor storage replica
perfmon.exe

#create files on source volume
$path = "r:\"
$file = [io.file]::create("$path\data.txt")
$file.SetLength(100mb)
$file.Close()

$file = [io.file]::create("$path\stuff.dat")
$file.SetLength(1gb)
$file.Close()

$file = [io.file]::create("$path\files.bak")
$file.SetLength(3gb)
$file.Close()
