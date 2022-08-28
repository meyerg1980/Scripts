Get-Service 'DHCP Client','DNS Client' | Set-Service -StartupType Automatic -PassThru

Get-ChildItem .\ | Copy-Item -Destination c:\drivers -PassThru

Get-CimInstance -ClassName Win32_NetworkAdapterConfiguration -Filter "description like '%intel%'" | fl


(Get-CimClass Win32_NetworkAdapterConfiguration).CimClassMethods 

Get-CimInstance -ClassName Win32_NetworkAdapterConfiguration -Filter "description like '%intel%'" | Invoke-CimMethod -MethodName EnableDHCP

#no good, error
@("vaultint1", "vaultprod1", "vaultint2", "vaultprod2") | new-azkeyvault 

get-content -path vaultstocreate.txt | ForEach-Object -Process{
    New-AzKeyVault -ResourceGroupName meyer -Location 'US Chicago' -Name $_
}


Get-Content -Path servers.txt | ForEach-Object -Process {
    Write-Output $_
    Start-Sleep 1
}

Measure-Command {
    Get-Content -Path servers.txt |
    ForEach-Object -Process {
    Write-Output $_
    Start-Sleep 1
    }
    }


    Measure-Command {
        Get-Content -Path servers.txt |
        ForEach-Object -Parallel {
        Write-Output $_
        Start-Sleep 1
        }
        }

#all do the same
Get-Process -name *B* | Stop-Process
Get-Process -name *B* | ForEach-Object { $_.Kill()}
Get-Process -Name *B* | ForEach-Object -Parallel { Stop-Process $_ }

get-content 

(Get-ChildItem '*deletme*').Delete() 


Get-ChildItem *deleteme* | Remove-Item -Recurse -Force
Remove-Item *deleteme* -Recurse -Force

Get-ChildItem *deleteme* | foreach {$_.Delete()}

Get-content computers.txt | foreach {$_.ToUpper()}
