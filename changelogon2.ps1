function Set-MEYServiceLogon{
    [CmdletBinding(SupportsShouldProcess,ConfirmImpact='Low')]
    param(
        [parameter(Mandatory,ValueFromPipeline,ValueFromPipelineByPropertyName)]
        [string[]][Alias('MachineName','HostName')]$Computername='localhost',
        [parameter(Mandatory)][string]$Service,
        [parameter(Mandatory)][string]$DomainUser,
        [parameter(Mandatory)][string]$DomainPassword,
        [ValidateSet('Wsman','Dcom')][string]$protocol='wsman',
        [string]$LogFailuresToPath,
        [switch]$ProtocolFallback
    
    )
    begin{}
    
    process{
    foreach($computer in $Computername){
    
        if($protocol -eq 'Dcom'){
        $option=New-CimSessionOption -Protocol Dcom
    }
    else {
        $option=New-CimSession -Protocol Wsman
    }
    $ServToChange=Get-CimInstance -ClassName Win32_Service |where{$_.name -like $Service}
    $session=New-CimSession -ComputerName $computer -SessionOption $option
    $returncode = Invoke-CimMethod -CimSession $session -InputObject $ServToChange -MethodName Change -Arguments @{'StartName'=$DomainUser;'StartPassword'=$DomainPassword} | 
    Select-Object -Property @{n='Computer';e={$computer}},@{n='Result';e={$_.ReturnValue}}
    $session | Remove-CimSession 
            }#foreach
        }#process
    end{}#empty
    }#function