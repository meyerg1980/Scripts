function Get-MyVMs($server) {
Get-MyVMs -computername $server
}

$server = "Hyperv"
Get-MyVMs $server

function Get-MyVMs($server) {
    Get-MyVMs -computername $server
    }

Export-ModuleMember -Function Get-MyVMs
