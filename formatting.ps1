cd $pshome/Modules/PSReadLine
code PSReadLine.format.ps1xml
Get-PSReadLineKeyHandler | get-member
Get-FormatData -PowerShellVersion 7.1 -TypeName Microsoft.PwerShell.KeyHandler

code /tmp/Uri.Types.ps1xml

Update-TypeData -Path /tmp/Uri.Types.ps1xml

Get-Verb | fl *

Get-Process | format-table Name, @{name='vm(mb)' ;expression={$_.VM / 1mb -as [int]}}

Get-Process | 
Format-Table Name,
@{name = 'VM(mb)' ;expression = {$_.VM / 1mb -as [int]}} -AutoSize

Get-Process |
Format-Table Name,
@{name='VM(MB)';expression={$_.VM};formatstring='F2';align='right'}
-AutoSize

#same thing
Get-ChildItem | Format-Wide
Get-ChildItem | Format-Wide | Out-Host

Install-Module Microsoft.PowerShell.GraphicTools

Get-Process | format-table Name, @{name='vm(mb)' ;expression={$_.VM / 1mb -as [int]}}, ID, PagedMemorySize64, VirtualMemorySize64

get-module | Format-Table Name @{Name='ModuleName' ;expression ={$_.name}}, Version @{name='ModuleVersion' ;expression = {$_.Version}}

Get-Module| Format-Table -property  @{name='ModuleName';expression={$_.Name }}, @{name='ModuleVersion';expression={$_.Version}} 




get-module | Format-Table @{Name='ModuleName' ;expression ={$_.name}}

get-module | Format-Table version @{name='ModuleName' ;expression ={$_.Version}}

Get-Process -name * | where-Object {$_.name -notlike "*pwsh*"} | Sort-Object VirtualMemorySize -Descending | select -First 10 | Measure-Object VirtualMemorySize -Sum


Get-Process -Name (Get-Content c:\names.txt | Where-Object -filter { $_ -notlike '*daemon' }) | Where-Object -filter { $_.WorkingSet -gt 128KB }

Get-Process |
Format-Table Name,
@{name='VM(MB)';expression={$_.VM};formatstring='F2';align='right'}
-AutoSize