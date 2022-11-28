function Set-TMServiceLogon {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$True,ValueFromPipelineByPropertyName=$True)]
        [string]$Service,
        [Parameter(Mandatory=$True,ValueFromPipeline=$True,ValueFromPipelineByPropertyName=$True)]
        [string[]]$ComputerName,
        [Parameter(ValueFromPipelineByPropertyName=$True)][string]$DomainPassword,
        [Parameter(ValueFromPipelineByPropertyName=$True)][string]$DomainUser,
        [string]$ErrorLogFilePath
        )  
        BEGIN{}
        PROCESS{
            ForEach ($c in $ComputerName) {
                $option = New-CimSessionOption -Protocol Wsman
                $session = New-CimSession -SessionOption $option -ComputerName $Computer
                If ($PSBoundParameters.ContainsKey('DomainUser')) {
                    $args = @{'StartName'=$DomainUser
                    'StartPassword'=$DomainPassword}
                } Else { 
                    $args = @{'StartPassword'=$DomainPassword}
                }
                $params = @{'CimSession'=$session 
                'MethodName'='Change' 
                'Query'="SELECT * FROM Win32_Service WHERE Name = '$ServiceName'" 
                'Arguments'=$args}
                $returnCode = Invoke-CimMethod @params
                switch ($returnCode.ReturnValue) {
                    0 { $status = "Success" }
                    22 { $status = "Invalid Account" }
                    Default { $status = "Failed: $($ret.ReturnValue)"}
                }
                $properties = @{'ComputerName'=$computer 
                'Status'=$status}
                $object = New-Object -TypeName PSObject -Property  $properties
                Write-Output $object
                $session | Remove-CimSession
            }#foreach
        }#process
    end{}
}#function
