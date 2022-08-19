#define security groups
$jeaconfigpath = "$env:programdata\jeaconfiguration"
$jradmingroup = "meyersec\dnsjradmins"
$admingroup = "meyersec\dnsadmins"

#create session config file 
New-Item $jeaconfigpath -ItemType Directory -Force
New-PSSessionConfigurationFile -path (Join-Path $jeaconfigpath "jeaddnsconfig.pssc") `
                               -SessionType RestrictedRemoteServer `
                               -transcriptdirectory (Join-Path $jeaconfigpath "Transcripts") `
                               -RunAsVirtualAccount `
                               -RoleDefinitions @{ $jradmingroup = @{ RoleCapabilties = "dnsadmin" }; $admingroup = @{ RoleCapabilties = "dnsjradmin", "dnsadmin"} }

#register the session endpoint 
Register-PSSessionConfiguration -name dnsadministration -Path (Join-Path $jeaconfigpath "jeadnsconfig.pssc") -Force


# enter remote session as admin
Enter-PSSession dns -ConfigurationName dnsadministration

#view cmdlets
get-command *dns*


#enter session as jradmin
Enter-PSSession dns -Credential (Get-Credential) -ConfigurationName dnsadministration
get-command *dns*
