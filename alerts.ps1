[Console]::beep(2000,1000)

$User = "gmeyer80"
$message = "attention needed"

msg $User $message
Add-Type -AssemblyName PresentationFramework
[System.Windows.messagebox]::show("Attention needed!!!")
