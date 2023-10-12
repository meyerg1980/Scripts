Get-NetTCPConnection | Where-Object { ($_.State -eq 'Established') -and (($_.RemotePort -eq 80) -or ($_.RemotePort -eq 443)) } |
Format-Table -Property OwningProcess, LocalAddress, RemoteAddress, RemotePort

Get-NetTCPConnection | Where-Object { ($_.State -eq 'Established') -and (($_.RemotePort -eq 80) -or ($_.RemotePort -eq 443)) } |
ForEach-Object { [PSCustomObject]@{ OwningProcess=$_.OwningProcess; LocalAddress=$_.LocalAddress; RemoteAddress=$_.RemoteAddress; RemotePort=$_.RemotePort; Hostname=((Resolve-DnsName $_.RemoteAddress -ErrorAction SilentlyContinue)
| Select-Object -ExpandProperty NameHost) } } | Format-Table

$previousConnections = @()
while ($true) {
    $currentConnections = Get-NetTCPConnection | Where-Object { ($_.State -eq 'Established') -and (($_.RemotePort -eq 80) -or ($_.RemotePort -eq 443)) }
    $newConnections = $currentConnections | Where-Object { $_.CreationTime -notin $previousConnections.CreationTime }

    $newConnections | ForEach-Object {
        [PSCustomObject]@{
            OwningProcess  = $_.OwningProcess
            LocalAddress   = $_.LocalAddress
            RemoteAddress  = $_.RemoteAddress
            RemotePort     = $_.RemotePort
            Hostname       = (Resolve-DnsName $_.RemoteAddress -ErrorAction SilentlyContinue).NameHost
            CreationTime   = $_.CreationTime
        }
    } | Format-Table

    $previousConnections = $currentConnections
    Start-Sleep -Seconds 5  # Adjust the polling interval as needed
}