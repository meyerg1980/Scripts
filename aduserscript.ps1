$users = @("user25","user26","user27","user28","user29","user30")
$NewPassword = (ConvertTo-SecureString -AsPlainText "Fu5ion27@" -Force)
foreach ($user in $users)
{
    New-ADUser -Name $user -UserPrincipalName $user"@meyersec.com" -Office "Chicago" 
    Set-ADAccountPassword -identity $user -NewPassword $NewPassword -Reset
    Enable-ADAccount -Identity $user
} 

$users = Import-Csv C:\Users\gmeyer80\Desktop\Scripts\newusers.csv
$NewPassword = (ConvertTo-SecureString -AsPlainText "Fu5ion27@" -Force)
foreach ($user in $users)
{
    New-ADUser -Name $user
    Set-ADAccountPassword -identity $user -NewPassword $NewPassword -Reset
    Enable-ADAccount -Identity $user
} 

for ($A = 25; $A -le 30; $A++)
{
    $user = "user$A"
    Write-Host $user
    Set-ADUser $user -Office "Miami"
} 

iport C:\Users\gmeyer80\Desktop\Scripts\newusers.csv | ForEach-Object {Set-ADUser $_.users -Department "Marketing"}