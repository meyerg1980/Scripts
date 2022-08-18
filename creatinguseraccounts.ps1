New-ADUser -Name "user23" -UserPrincipalName "user1@meyersec.com"

Get-ADUser -Filter {-Name -like "*user"} | Select-Object Name, Enabled 

Get-ADUser user23 -Properties Enabled | Select-Object Name, Enabled

 
Set-ADAccountPassword -Identity user23 
Enable-ADAccount -Identity user23

New-ADUser -Name user24 -AccountPassword(Read-Host -AsSecureString "AccountPassword")

# not working in version 7
New-ADUser -Name user25 -AccountPassword(Read-Host -AsSecureString "AccountPassword") -PassThru | Enable-ADAccount 

Import-Csv C:\Users\gmeyer80\Desktop\Scripts\newusers.csv | New-ADUser -PassThru | Set-ADAccountPassword -Reset -NewPassword (ConvertTo-SecureString -AsPlainText "Fu5ion27@" -Force) -PassThru | Enable-ADAccount