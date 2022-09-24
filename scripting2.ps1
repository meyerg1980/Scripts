Import-Module ActiveDirectory 
# Retrieve the dNSHostName attribute from all computer accounts in AD
$ComputerNames = Get-ADComputer -Filter * -Properties dNSHostName |Select-Object -ExpandProperty dNSHostName

$AllComputerShares = @()

foreach($Computer in $ComputerNames)
{
    try{
        $Shares = Get-ciminstance -ComputerName $Computer -Class Win32_Share -ErrorAction Stop
        $AllComputerShares += $Shares
    }
    catch{
        Write-Error "Failed to connect retrieve Shares from $Computer"
    }
}

Get-CimInstance -ClassName Win32_ComputerSystem -ComputerName dc -