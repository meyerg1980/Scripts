$mypassword = Read-Host -AsSecureString | ConvertFrom-SecureString
$mypassword | Out-File -FilePath C:\Users\gmeyer80\Desktop\Scripts\password.txt

$User = "MyUserName"
$File = "C:\Users\gmeyer80\Desktop\Scripts\password.txt"
$mycredential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $User, (Get-Content $File | ConvertTo-SecureString)


