Import-Module ActiveDirectory 
# Retrieve the dNSHostName attribute from all computer accounts in AD
$ComputerNames = Get-ADComputer -Filter * -Properties dNSHostName |Select-Object -ExpandProperty dNSHostName

$AllComputerShares = @()

foreach($Computer in $ComputerNames)
{
    try{
        $Shares = Get-CimInstance -ComputerName $Computer -classname Win32_Share  -ErrorAction SilentlyContinue
        $AllComputerShares += $Shares
    }
    catch{
        Write-Error "Failed to connect retrieve Shares from $Computer"
    }
}
$AllComputerShares | select Path,InstallDate,AccessMask | Out-File /shares.csv

Get-CimInstance Win32_Share

$ComputerNames = Get-ADComputer -Filter * -Properties dNSHostName |Select-Object -ExpandProperty dNSHostName 
Get-CimInstance -ComputerName $ComputerNames -ClassName win32_share

try {$ComputerNames | Get-CimInstance -ClassName win32_share} `
catch {Write-Error "failed to connect"}


$computernames = ("dc","gns3","fs1","cs")
$compshares = @()
foreach ($computer in $computernames)
{
    $shares = Get-CimInstance -computername $ComputerNames -ClassName win32_share | sort -Property pscomputername
    $compshares += $Shares
} 


$largeFiles = get-childitem "c:\windows\system32\" | where{$_.length –gt 20MB}
$count = $largeFiles.count 
Write-host "There are $count Files over 20MB"
write-host "Files Over 20MB in c:\Windows\System32\ :"
$largefiles | select-object name,length,lastwritetime | format-list

