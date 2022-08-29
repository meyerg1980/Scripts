#single quote variable - literal
$var = 'What does $var contain?'
$var
What does $var contain?

#double quote - what's in the variable
$computername = 'SRV-02'
$phrase = "The computer name is $computername"
$phrase
The computer name is SRV-02

#change original variable - phrase variable remains unchanged
$computername = 'SERVER1'
$phrase
The computer name is SRV-02

#special character ` changes $ to literal
$computername = 'SRV-02'
$phrase = "`$computername contains $computername"
$phrase
$computername contains SRV-02

# ` changes n to new line like python
$phrase = "`$computername`ncontains`n$computername"
$phrase
$computername
contains
SRV-02

#multiple objects in variable
$computers = 'SRV-02','SERVER1','localhost'
$computers
SRV-02
SERVER1
Localhost

#index
$computers[0]

#access objext in the variable and call methods
$computername.length
6
$computername.toupper()
SRV-02
$computername.tolower()
srv-02
$computername.replace('02','2020')
SRV-2020
$computername
SRV-02


#access specific contents in variable
$computers[0].tolower()
SRV-02
$computers[1].replace('SERVER','CLIENT')
CLIENT1

#replace contents of variable
$computers[1] = $computers[1].replace('SERVER','CLIENT')
$computers
SRV-02
CLIENT1
Localhost

#replace contents in variable and store in same variable
$computers = $computers | ForEach-Object { $_.ToLower()}
$computers
srv-02
client1
localhost

#both same
$processes = Get-Process
$processes.Name

Get-Process | ForEach-Object { $_.Name }

Get-Process | Select-Object –ExpandProperty Name

#double quote trick | doesn't work
$processes = Get-Process
$firstname = "$processes[0].name"
$firstname

#double quote trick that does work
$processes = Get-Process | where-object {$_.Name}
$firstname = "The first name is $($processes[0].name)"
$firstname

$processes = Get-Process | where-object {$_.Name}
$var = "Process names are $processes.name"
$var

#changing variable type
$number = Read-Host "Enter a number"
Enter a number: 100
$number = $number * 10
$number
100100100100100100100100100100

int[$number] = Read-Host "Enter a number"
Enter a number: 100
$number = $number * 10
$number
1000


[int] —Integer numbers
[single] and [double] —Single-precision and double-precision floating numbers (numbers with a decimal portion)
[string] —A string of characters
[char] —Exactly one character (e.g., [char]$c = 'X' )
[xml] —An XML document; whatever string you assign to this will be parsed to
make sure it contains valid XML markup (e.g., [xml]$doc = Get-Content
MyXML.xml )

#working with variables cmdlts ~ don't need to use
New-Variable
Set-Variable
Remove-Variable
Get-Variable
Clear-Variable


invoke-command -ScriptBlock {Get-ChildItem / -Recurse -filter '*.txt'} -ComputerName dc -AsJob

