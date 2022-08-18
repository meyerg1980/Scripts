(Get-Process | where-object {$_.Name -eq "notepad"}).kill

(Get-Process | where-object {$_.Name -eq "notepad"}).kill.()

#not efficeint
(Get-Process | Sort-Object -Property Name | where-object {$_.Name -eq "notepad"})

#more efficient
Get-Process -name notepad | Sort-Object -Property id 

ipconfig | select-string -pattern 255

Get-Process | select-object -Property name, @{name = "procid";expression = {$_.id}}

Get-Process | where handles -gt 1000

Get-Process | where handles -gt 1000 | Sort-Object -Property handles | format-table name, handles -autosize

Get-Process w* | clipboard

Get-Process | Sort-Object WorkingSet -Descending | Select-Object -First 5 ascending

Get-WinEvent -LogName security -MaxEvents 5   .\.bash_history

Invoke-Command -ComputerName dc, cs -ScriptBlock {Get-WinEvent -LogName security -MaxEvents 5}

Get-NetAdapter | Where-Object {$_.name -like "*Ethernet*"}

$procs = Get-Process
notepad
$procs2 = Get-Process
Compare-Object -ReferenceObject $procs -DifferenceObject $procs2 -Property name  

#passthru keeps the pipeline going
get-aduser user23 | disable-adaccount -passthru 

get-aduser -filter * -property "lastlogondate" 
    | Where-Object {$_.lastlogondate -le (get-date).AddDays(-60)} 
        | Sort-Object -Property lastlogondate -Descending 
            | Format-Table -Property name, lastlogondate -AutoSize
            

get-aduser -Filter * -property "lastlogondate" 
    | Where-Object {$_.lastlogondate -le (get-date).AddDays(-60)} 
        | Sort-Object -Property lastlogondate -Descending 
            | disable-adaccount 
               
            #set confirm preference
            $ConfirmPreference = "medium"

