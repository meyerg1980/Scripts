Import-Module ActiveDirectory 
# Retrieve the dNSHostName attribute from all computer accounts in AD
$ComputerNames = Get-ADComputer -Filter * -Properties dNSHostName |Select-Object -ExpandProperty dNSHostName

$AllComputerShares = @()

foreach($Computer in $ComputerNames)
{
    try{
        $Shares = Get-CimInstance -ComputerName $Computer -classname Win32_Share  -ErrorAction Stop
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

$ComputerNames = Get-ADComputer -Filter * -Properties dNSHostName |Select-Object ($ComputerNames).dNSHostName

try {$ComputerNames | Get-CimInstance -ClassName win32_share
-ErrorAction Stop 
} 
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

icm -seesion $s  (Install-WindowsFeature web-server)

$servers | foreach{copy-item c:\default.htm -Destination \\$_\c$\inetpub\wwwroot}

$s = New-PSSession 
Import-PSSession -session $s -Module activedirectory -prefix remote


Function set-stuff{
    [CmdletBinding(SupportsShouldProcess=$True,
                    ConfirmImpact='Medium')]
    param(
        [Parameter(Mandatory=$True)]
        [string]$computername
    )
    Process{
        #if true do what's in parenthesis, if not true don't do it and write-output
        if ($PSCmdlet.ShouldProcess("$Computername","Mess it up seriously!")){
            Write-Output "I'm changing something right now"
        }
    }
}

