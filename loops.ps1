#for loops

for ($i = 1; $i -lt 11; $i++)
#loop body
{
    Write-Host $i
}
Write-Host("The loop has ended")

#do while loop

$i = 1
do 
{
    Write-Host $i
    $i++
}
while($i -lt 11)
Write-Host("The loop has ended")

#do until loop

$i = 1
do
{
    Write-Host $i
    $i++
}
until ($i -eq 11)
Write-Host("the loop has ended")

#breaking out of a loop

$i = 1
do 
{
    Write-Host $i
    if ($i -eq 10)
    {
        Break
    }
    $i++
}
while ($i -gt 0)
Write-Host("The loop has ended")

#for each loop

$servers = @("Server1","Server2","Server3","Server4")
foreach ($server in $servers)
    {
        Write-Host $server
    }
Write-Host("THe loop has ended")

#for each object loop

$servers = @("Hyperv1","Hyperv2","Hyperv3","Hyperv4")
foreach ($server in $server)
{
    Write-Host ("These are the virtual machines hosted on server") $server
    $vms = get-vm -computername $server
    Write-Host $VMs.name
    Write-Host(" ")
}
Write-Host("The loop has ended")

