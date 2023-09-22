function Set-GDriveCert {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory)][string]$user

    )
$rootCA = get-content "C:\Users\$user\Desktop\Certs\rootcaCert.pem"
$caCert = get-content "C:\Users\$user\Desktop\Certs\caCert.pem"
$version = Get-Process GoogleDriveFS | Select-Object -ExpandProperty ProductVersion -First 1
$RootsPem = get-content "C:\Program Files\Google\Drive File Stream\$version\config\roots.pem"

$RootsPem += $rootCA
$RootsPem += $caCert
$RootsPem | Out-File -FilePath "C:\Program Files\Google\Drive File Stream\roots.pem"

New-ItemProperty -Path "HKLM:\Software\Google\DriveFS" -Name "TrustedRootCertsFile" `
-Value "C:\Program Files\Google\Drive File Stream\roots.pem" `
-PropertyType "string"
}