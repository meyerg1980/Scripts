Import-Csv .\newusers.csv |
Select-Object -Property *,
@{name = 'samAccountName'; expression={$_.login}},
@{label = 'Name'; expression={$_.login}},
@{n = 'Department'; e={$_.Dept}} |
New-ADUser
