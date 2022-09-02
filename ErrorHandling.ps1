# all errors put into this variable by default, most recent $error[0]
$Error
$ErrorActionPreference = 'Ignore' # to ignore errors

#send errors to use at later time
New-PSSession -computername srv01 -ErrorVariable

#ErrorVariable will only hold the most recent error unless you add a + (plus) sign in front of it:
New-PsSession -ComputerName SRV01 -ErrorVariable +a

$computer = 'Srv01'
Write-Verbose "Connecting to $computer"
$session = New-PSSession -ComputerName $computer -ErrorAction Stop

$computer = 'Srv01','DC01','Web02'
Write-Verbose "Connecting to $computer"
$session = New-PSSession -ComputerName $computer -ErrorAction Stop

foreach ($computer in $computername) {
    Write-Verbose "Connecting to $computer"
    $session = New-PSSession -ComputerName $Computer -ErrorAction Stop
    }

$computer = 'Srv01','DC01','Web02'
$session = New-PSSession -ComputerName $Computer -ErrorVariable +a

Get-Service Spooler, Print -ErrorVariable +a

try { blahfoo }
catch { Write-Warning “Warning: An error occurred." }

#modify error handling for duration of one command
Try {
    $ErrorActionPreference = "Stop"
    # run something that doesn't have -ErrorAction
    $ErrorActionPreference = "Continue"
    } Catch {
    # ...
    }
    Try {
        # something here generates an exception
        } Catch [Exception.Type.One] {
        # deal with that exception here
        } Catch [Exception.Type.Two] {
        # deal with the other exception here
        } Catch {
        # deal with anything else here
        } Finally {
        # run something else
        }





function Get-CompUp {
    param (
    [Parameter(Mandatory=$True)]
    [Alias('host')]
    [string]$computername
)
invoke-command -ComputerName $computername -ScriptBlock{Get-Uptime}
}     
Get-CompUp

Function Get-PCUpTime {
    param (
    [Parameter(Mandatory=$True)]
    [string[]]$ComputerName = 'localhost'
)
try {
    foreach ($computer in $computerName) {
    If ($computer -eq "localhost") {
    Get-Uptime
}
    Else { Invoke-command -ComputerName $computer -ScriptBlock{ Get-Uptime -ErrorAction Stop}}
    }
}
    catch {
    Write-Error "Cannot connect To $computer"
    }
}
