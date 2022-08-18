for ($n = 1; $n -le 100; $n++)
{
    Write-Progress -Id 0 "$n% Complete"
#write progress -activity "Task in progress" -status "$n% Complete:"
    Start-Sleep -Milliseconds 250
}

foreach ($n in 1..100)
{
    Write-Progress -id 0 -Activity "Overall task in progress" -Status "$n% Complete:" -PercentComplete 100
    foreach ($p in 1..100)
    {
        Write-Progress -id 1 -Activity "Sub-task in progress" -Status "$n% Complete:"  -PercentComplete 100
    }
}