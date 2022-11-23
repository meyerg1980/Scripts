function Set-MEYServiceLogon {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)][string]$Service,
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string[]][Alias('Hostname', 'MachineName')]$ComputerName = 'localhost',
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)][string]$DomainUser,
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)][string]$DomainPassword,
        [string][ValidateSet('Wsman', 'Stop', 'Dcom')]$Protocol = 'Wsman',
        [string]$ErrorLogFilePath,
        [switch]$ProtocolFallback
    )  
    BEGIN {}
    PROCESS {
        ForEach($Computer in $ComputerName) {

            do {
                Write-Verbose "Connect to $computer on Wsman"
                $protocol = "Wsman"
                try {
                    $option = New-CimSessionOption -Protocol $Protocol
                    Write-Verbose "Coneecting to $Computer over $Protocol"
                    $session = New-CimSession -SessionOption $option -ComputerName $Computer -ErrorAction Stop
                    $ServToChange = Get-CimInstance -ClassName Win32_Service | Where-Object {$_.name -like $Service}
                    Write-Verbose "getting $service to change logon"
                    If ($DomainUser -ne "") {
                        $Arguments = @{'StartName' = $DomainUser
                                       'StartPassword' = $DomainPassword
                        }
                    }
                    Else { 
                        $Arguments = @{'StartPassword' = $DomainPassword}
                        Write-Warning "No new domain account set"
                    }
                    $Parameters = @{'CimSession' = $Session 
                                    'MethodName' = 'Change' 
                                    'InputObject' = $ServToChange
                                    'Arguments' = $Arguments
                    }
                    Write-Verbose "Changing Logon for $service to user $DomainUSer"
                    $returnCode = Invoke-CimMethod @parameters
                    switch ($returnCode.ReturnValue) {
                        0 {$status = 'Success'}
                        22 {$status = 'Invalid Account'}
                        Default {$status = "Failed: $($returnCode.ReturnValue)"}
                    }
                    $properties = @{'ComputerName' = $Computer 
                                    'Status' = $status
                    }
                    $object = New-Object -TypeName PSObject -Property  $properties
                    Write-Output $object
                    Write-Verbose "Removing connection to $ComputerName"
                    $session | Remove-CimSession
                }
                catch {
                    #change protocol, if both failed log computer
                    switch ($Protocol) {
                        'Wsman' {$protocol = 'Dcom'}
                        'Dcom' {$protocol = 'stop'
                            if ($ErrorLogFilePath) {
                                Write-Warning "$Computer failed; logged to $ErrorLogPathFile"
                                $computer | Out-File $ErrorLogPathFile -Append
                            }#if logging
                        }
                    }#switch
                }#try/catch
            } until ($Protocol = 'Stop')
        }#foreach
    }#process
    end {}
}#funstion


