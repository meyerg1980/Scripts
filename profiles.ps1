
#$pshome\profile.ps1—This will execute for all users of the computer, no matter
#which host they’re using (remember that $pshome is predefined within
#PowerShell and contains the path of the PowerShell installation folder).

#$pshome\Microsoft.PowerShell_profile.ps1—This will execute for all users of
#the computer if they’re using the console host.

#$pshome/Microsoft.VSCode_profile.ps1—If you are using the VS Code with
#the PowerShell extension, this script will be executed instead.

#$home\Documents\WindowsPowerShell\profile.ps1—This will execute only for
#the current user (because it lives under the user’s home directory), no matter
#which host they’re using.

#$home\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1—
#This will execute for the current user if they’re using the console host. If they’re
#using VS Code with the PowerShell extension, the $home\Documents\Windows-
#PowerShell\Microsoft.VSCode_profile.ps1 script will be executed instead.
#>

# ErrorForegroundColor
# ErrorBackgroundColor
# WarningForegroundColor
# WarningBackgroundColor
# DebugForegroundColor
# DebugBackgroundColor
# VerboseForegroundColor
# VerboseBackgroundColor
# ProgressForegroundColor
# ProgressBackgroundColor

1000 / 3 -as [int]

#types to convert to
[string] , [xml] , [int] ,
[single] , [double] , [datetime]

123.45 -is [int]
"SRV02" -is [string]
$True -is [bool]
(Get-Date) -is [datetime]

"192.168.34.12" -replace "34","15"
192.168.15.12

$array = "one","two","three","four","five"
$array -join "|"

$array = (gc computers.tdf) -split "`t"

$collection = 'abc','def','ghi','jkl'
$collection -contains 'abc'
false

$collection = 'abc','def','ghi','jkl'
'abc' -in $collection
true
#Trim() —Removes whitespace from both ends of a string.
# TrimStart() and TrimEnd() —Remove whitespace from the beginning or end
# of a string, respectively:

(get-date).month

$today = get-date
$90daysago = $today.adddays(-90)
$90daysago

$credential = Get-Credential -UserName Administrator
-Message "Enter Admin credential"
$PSDefaultParameterValues.Add('*:Credential',$credential)

$PSDefaultParameterValues.Add('Invoke-Command:Credential',
(Get-Credential -Message 'Enter administrator credential' `
-UserName Administrator})

$PSDefaultParameterValues

# The -FilterScript parameter of Where-Object takes a script block.
# The -Process parameter of ForEach-Object takes a script block.
# The hash table used to create custom properties with Select-Object , or cus-
# tom columns with Format-Table , accepts a script block as the value of the E, or
# Expression, key.
# Default parameter values, as described in the previous section, can be set to a
# script block.
# Some remoting and job-related commands, including Invoke-Command and
# Start-Job , accept script blocks on their -ScriptBlock parameter.