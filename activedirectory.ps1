Get-ADUser -Filter *

Get-ADUser -Filter * | Select-Object name 

Get-ADUser -Filter {Name -like "*gmeye*"} | Select-Object name 

Get-ADUser gmeyer80 -Properties Department, Manager | Select-Object Name, Department, Manager

Get-ADUser -filter * -Properties Department, Manager | Select-Object Name, Department, Manager

Get-ADUser -filter {Name -like "*User*"} -Properties Department, Manager | Select-Object Name, Department, Manager

Get-ADUser -Filter {Department -eq "Finance"} -Property Department, Manager | Select-Object Name, Department, Manager

Get-ADUser -Filter {Department -eq "Finance"} -Property Department, Manager, Title, Office | Select-Object Name, Department, Manager, Title, Office

Get-ADUser -Filter {Office -eq "Miami" and Department -eq "Finance"} -Property Department, Manager, Title, Office | Select-Object Name, Department, Manager, Title, Office

Get-ADUser -filter {Name -like "*User*"} | Select-Object Name, Department, Manager











