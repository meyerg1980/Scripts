import-csv c:\scripts\newusers.csv |
ForEach-Object {New-aduser -Name $_.Name }

#run previous command all at once
import-csv c:\scripts\newusers.csv |
ForEach-Object -Parallel {New-aduser -Name $_.Name }


1..5 | ForEach-Object {Write-Output $_; start-sleep -Seconds 2}

measure-command {1..5 | ForEach-Object {Write-Output "$_";start-sleep -Seconds 2}}

1..5 | ForEach-Object -parallel {Write-Output "$_"; start-sleep -Seconds 2}

measure-command {1..5 | ForEach-Object -parallel {Write-Output "$_"; start-sleep -Seconds 2}}

1..10 | ForEach-Object -parallel {Write-Output "$_"; start-sleep -Seconds 2} -ThrottleLimit 10

$n=1
While ($n -le 10){Write-Output $n; $n++}

While ($date.day -ne 25 -and $date.month -ne 12)
{Write-Host “Its not Christmas Yet”}

$date = get-date
do {
Write-Output "Checking if the month is December"
$date = $date.AddMonths(1)
} while ($date.Month -ne 12 )

$items = Get-ChildItem
foreach ($i in $items){Write-Output "The character length of $i is" ($i).Length}

Start-Process .\notepad.exe
$process = "notepad"
do {Write-Host "Process is open"
} while ((Get-Process).Name -contains "notepad")
