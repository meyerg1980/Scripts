Read-Host "Enter a computer name"

$computername = Read-Host "Enter a computer name"

Write-Host "colorful!" -ForegroundColor White -BackgroundColor Black

#sent to pipeline
write-output "Hello" | where-object { $_.length -gt 10 }

#does not get sent to pipeline
write-host "Hello" | where-object { $_.length -gt 10 }

#
Write-Warning # Displays warning text, in yellow and preceded by the label WARNING: $WarningPreference (SilentlyContinue by default)
Write-Verbose # Displays additional informative test, in yellow. $verbosepreference (silentlycontinue by default)
Write-Debug # Displays debugging text, in yellow, $debugpreference (silentlycontinue by default)
write-error # Produces an error message, $erroractionpreference (continue by default)
write-information # Displays informational messages, allows structured data to be written to an information stream $informationpreference (silentlycontinue) 

$name = Read-Host "Please enter your name"
Write-Host $name -ForegroundColor Yellow 