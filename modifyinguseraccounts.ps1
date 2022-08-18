Get-ADUser user23 -Properties Office | Select-Object Name, Office

Set-ADUser user23 -Office "Las Vegas"

Get-ADUser -Filter {Name -like "*user*" -and Office -notlike "*"} | Select-Object Name, Office

Get-ADUser -Filter {Name -like "*user*" -and Office -notlike "*"} | Set-ADUser -Office "Miami"

Get-ADUser -filter * -Properties Office | Select-Object Name, Office

Get-ADUser user23 -Properties Office | Select-Object Name, Office


