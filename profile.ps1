Write-Output "It Worked"
function prompt {
    $time = (Get-Date).ToShortTimeString()
    "$time [$env:COMPUTERNAME]:> "
    }
$host.UI.RawUI.WindowTitle = "$env:username"
(Get-Host).PrivateData.ErrorForegroundColor = "green"