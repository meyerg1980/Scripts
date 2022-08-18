#create role capapbility file
New-PSRoleCapabilityFile -path .\junioradminscapabilty.psrc  

#create session config file
New-PSSessionConfigurationFile -path .\junioradminsconfig.pssc 

#create a session on remote hv (admin)
Enter-PSSession -ComputerName fs1 

#register session config
Register-PSSessionConfiguration -name "junioradminconfig" -path .\junioradminsconfig.pssc

#view config
Get-PSSessionConfiguration

#view available powershell commands
Get-Command

# end session
Exit-PSSession

# create sesion (junior admin) 
Enter-PSSession -ComputerName fs1 -ConfigurationName "junioradmins" -Credential "meyersec\junioradmin"

#view virtual machines
Get-VM

# view commands for junior admin
Get-Command

#end session
Exit-PSSession

