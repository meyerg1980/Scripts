Set-TMServiceLogon -ServiceName LOBApp 
-NewPassword "P@ssw0rd"                    
-ComputerName SERVER1,SERVER2                    
-ErrorLogFilePath failed.txt                    
-Verbose  

Set-TMServiceLogon -ServiceName OurService                    
-NewPassword "P@ssw0rd"                    
-NewUser "COMPANY\User"                    
-ComputerName SERVER1,SERVER2  

Get-Content servers.txt | 
Set-TMServiceLogon -ServiceName TheService -NewPassword "P@ssw0rd"  

Import-CSV tochange.csv | 
Set-TMServiceLogon | 
ConvertTo-HTML  


#my version
$serv = Get-CimInstance -ClassName Win32_Service | where{$_.name -like "BITS"}
$sess = New-CimSession -ComputerName cs, gns3
Invoke-CimMethod -CimSession $sess -InputObject $serv -MethodName change -Arguments @{'StartName'='meyersec\gmeyer80';'StartPassword'='Fu5ion27@@??'}

#books version
Invoke-CimMethod -Query "SELECT * FROM Win32_Service  WHERE Name='BITS'" `
-Method Change `
-Arguments @{'StartName'='DOMAIN\User'; 'StartPassword'='P@ssw0rd'} `
-Computername $env:computername  


