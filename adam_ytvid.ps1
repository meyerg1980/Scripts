$hashtable = @{color = "red"; transmission = "automatic"; convertible=$false}

[PSCustomObject]$hashtable
$car = [PSCustomObject]$hashtable
$car | gm

get-content -Path \\cs\Share1\Scripts\example.txt | foreach {$psitem}

get-content -Path \\cs\Share1\Scripts\example.txt | foreach {[pscustomobject]@{Computername = $PSItem}} | Test-Connection

#ad health check

