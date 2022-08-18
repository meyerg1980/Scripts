$c = Get-Credential -Credential administrator

Invoke-Command -VMName vm1 -Credential $c -ScriptBlock {Get-WindowsFeature hyper-v}

Enter-PSSession -VMName vm1 -Credential $c  

ipconfig

Install-WindowsFeature -name hyper-v Exit-PSSession

fsutil file createnew c:\file.dat 10000000
$s = New-PSSession -VMName vm1 -Credential $c
Copy-Item -ToSession $s -Path c:\file.dat -Destination C:\

