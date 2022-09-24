$filepath = "powershell.exe"
$arguments = "-ExecutionPolicy RemoteSigned"
start-process -filepath $filepath -Verb RunAs -ArgumentList $arguments


configuration Install-Telnet { 
    param($computers) 
    Node $computers { 
        WindowsFeature Telnet-Client { 
            Name = "TelnetClient" 
            Ensure = "Present"
            IncludeAllSubFeature = "True" 
        } 
    }
}
InstallTelnet -computers MyComputer


configuration InstallTelnet { 
    param($computers) Node $computers { 
        WindowsFeature Telnet-Client { 
            Name = "Telnet-Client" 
            Ensure = "Present" 
            IncludeAllSubFeature = "True" 
        } 
        WindowsFeature Telnet-Server { 
            Name = "Telnet-Server" 
            Ensure = "Present" 
            IncludeAllSubFeature = "True" 
            DependsOn = "[WindowsFeature]Telnet-Client" 
        } 
    }
}
$computer = $env:computernameInstallTelnet -computers $computer


Remove-WindowsFeature -name Telnet-Server 
write-host "Telnet-Server Feature Has Been Manually Removed From The System"
$testresult = test-dscconfigurationif 
($testresult -like "False") { 
    Restore-dscconfiguration 
}
$testresult = test-dscconfiguration
if ($testresult -like "True") {  
    write-host "Telnet-Server Successfully Restored on The System" 
}