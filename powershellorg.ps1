#getting started
Unblock-File *\* -Verbose
[datetime]$d = "12/31/2022"
[Validateset("a","b","c","d")][string]$s= "b"

$p = Get-Process lsass
"process id = $($p.Id)"

$services = Get-Service
$services{1..5}

"dc", "client" | outfile c:\comp.txt
"computers,ipaddress" | out-file c:\comp.csv
"dc,192.168.1.100" | Out-File c:\comp.csv -Append

Get-Service -name bits -computername (Get-Content c:\comp.txt)

Get-Service -computername (import-csv c:\comp.csv | Select-Object -ExpandProperty ComputerName)

Invoke-Command -ComputerName (Get-ADComputer -filter "name -like '*fs*'" | Select-Object -ExpandProperty name)  -ScriptBlock {
    Get-Service -Name BITS
}

#executes scripts and keeps variables
. .\script.ps1


#simple template
    function Verb-Noun {
        [CmdletBinding()]
        param (
            
            [parameter()][string]$mystring
        )
        
        begin{
            <#code#>"begin $mystring"
        }
        process{
            <#code#>"process $mystring"
        }
        end{
            <#code#>"end $mystring"
        }
    }


    function Verb-Noun {
        [CmdletBinding()]
        param (
            [parameter(valuefrompipeline=$true)]
            [string]$mystring
        )
        
        begin{
            <#code#>"begin $mystring"
        }
        process{
            <#code#>"process $mystring"
        }
        end{
            <#code#>"end $mystring"
        }
    }

    function Verb-Noun {
        [CmdletBinding()]
        param (
            [parameter(valuefrompipeline=$true)]
            [int]$x
        )
        
        begin{
            <#code#>$total = 0
        }
        process{
            <#code#>$total += $x
        }
        end{
            <#code#>"total = $total"
        }
    }

    



