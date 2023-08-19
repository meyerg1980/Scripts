$uri = "http://randomuser.me/api/"

$restmethod = Invoke-RestMethod -uri $uri -Method Get

$restmethod.results
$restmethod.info

$webrequest = Invoke-WebRequest -Uri $uri -Method Get
