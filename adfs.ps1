Add-KdsRootKey -EffectiveTime ((get-date).AddHours(-10))

set-adfsproperties -enableidpinitiatedsignonpage $true 

install-module msonline
$cert = newadfsazuremfatennantcertificate -tennantid meyersec
new-msolserviceprincipal credential -appprincipalid <id> -type asymetric -usage verify -value $cert

set adfsazuretennat -tennatid <id> -clientid <clientid>

connect-msolservice -credential (Get-Credential)
set-msoladfscontext -ComputerName adfsserver.meyersec.com 
convert-msoldomainfederated -domainname meyerec
get-msolfederationproperty -domainname meyersec.com