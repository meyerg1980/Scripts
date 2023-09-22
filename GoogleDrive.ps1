function Set-GDriveCert {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory)][string]$user

    )
$rootCA = get-content "C:\Users\$user\Desktop\Certs\rootcaCert.pem"
$caCert = get-content "C:\Users\$user\Desktop\Certs\caCert.pem"

$RootsPem = get-content "C:\Program Files\Google\Drive File Stream\80.0.1.0\config\roots.pem"

$RootsPem += $rootCA
$RootsPem += $caCert
$RootsPem | Out-File -FilePath "C:\Program Files\Google\Drive File Stream\roots.pem"

New-ItemProperty -Path "HKLM:\Software\Google\DriveFS" -Name "TrustedRootCertsFile" `
-Value "C:\Program Files\Google\Drive File Stream\roots.pem" `
-PropertyType "string"
}