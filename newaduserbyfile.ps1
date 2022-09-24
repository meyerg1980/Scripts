Import-Csv .\newusers.csv |
Select-Object -Property *,
@{name = 'samAccountName'; e={$_.login}},
@{label = 'Name'; e={$_.login}},
@{n = 'Department'; e={$_.Dept}} |
New-ADUser
