$compnames = "gns3,fs1,cs"
foreach($comp in $compnames)
    {
    invoke-command -ComputerName $comp {get-ciminstance -classname win32_diskdrive}
    invoke-command -computername $comp {get-ciminstance -classname Win32_ComputerSystem}

}


New-cimsession -name MyComputer
$newsession = get-cimsession -Name MyComputer
Invoke-cimmethod -cimsession $newsession -class win32_process -MethodName 
Create -Argument @{CommandLine='calc.exe';CurrentDirectory="c:\windows\system32"}


#do while loop
$x = 0
$myVar = $False
Do { If ($x –ne "4") {  
    Write-Host "This Task Has Looped $x Times" 
} 
If ($x –eq "4") { 
    $myVar = $True 
    Write-Host "Successfully executed the script $x times" } 
    $x++ 
} 
While ($myVar -eq $False)

#do until loop
$x = 1
$myVar = $False
Do { 
    If ($x –ne "4") {  
        Write-Host "This Task Has Looped $x Times" 
    } 
    If ($x –eq "4") { 
        $myVar = $True 
        Write-Host "Successfully executed the script $x times" 
    } 
    $x++ 
}
Until ($myVar -eq $True)

#foreach loop
$users = "Mitch", "Ted", "Tom", "Bill"
ForEach ($user in $users) { 
    Write-host "Hello $user!"
}

#for loop
For ($x = 1; $x –lt "5"; $x++) { 
    write-host "Hello World! Loop Attempt Number: $x"
}

#switch
$x = "th"
switch ($x) {
    this {Write-Host "value $x equals this"}
    that {Write-Host "value $x equals that"}
    Default {Write-Host "value $x doesn't match any other value"}
}
     # A Menu System for Use With This Example
     Function menu-system { 
        Write-host "*********************************************" 
        Write-Host "* Please Make A Selection Below:" 
        Write-Host "*" 
        Write-Host "* [1] Backup User Permissions." 
        Write-host "*" 
        Write-Host "* [2] Delete User Permissions."
        Write-host "*" 
        Write-Host "* [3] Restore User Permissions." 
        Write-host "*" 
        Write-host "*********************************************" 
        Write-host "" 
        Write-host "Please Make A Selection:" 
        
        # Prompt for a User Input. 
        $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") 
        # A Switch to Evaluate User Input. 
        Switch ($x.character) { 
            1 { write-host "Option 1: User Permissions Backed Up." } 
            2 { write-host "Option 2: User Permissions Deleted." } 
            3 { write-host "Option 3: User Permissions Restored." } 
            Default { 
                return $True 
            } 
        }
    }
            # A Loop Structure That will Loop Until $Restart doesn't equal true.
            Do { 
                $restart = Menu-system  
                If ($restart –eq $True) { 
                    cls 
                    write-host "!! Invalid Selection: Please Try Again"  write-host "" 
                }
            }
            Until ($restart –ne $True)


#exception handling
Function serviceExample($svcName) { 
    Get-service $svcName –ErrorAction SilentlyContinue –ErrorVariable err 
    If ($err) { 
        Write-host "Error! Error Details: $err" 
        return 
    }  
    Write-host "Successfully Retrieved Service Information for $svcName. "
}
ServiceExample "Windows Update" 
Write-host "" 
ServiceExample "Does Not Exist"

#try/catch

Try { 1+ "abcd"
}
Catch { 
    Write-host "Error Processing the Command: $_"
} 
Write-host ""  
Write-host "Attempting to Add a String without Exception Handling:"
1+ "abcd"

#cmdlt error catching try/catch/if
Try { 
    Get-process "Doesn't Exist" –ErrorAction SilentlyContinue –ErrorVariable err
}
Catch { 
    Write-host "Try/Catch Exception Details: $_"
}
if ($err) { 
    Write-host "Cmdlet Error Handling Error Details: $err"
}

#folder/registrty/file management

New-item -path "c:\Program Files\" -name MyCustomSoftware -ItemType Directory
new-item -Path HKCU:\SOFTWARE\MyCustomSoftware -Force

$logpath = "c:\Program Files\MyCustomSoftware\Logs\"
New-item -path $logpath -ItemType Directory | out-null
$itemname = (get-date -format "yyyyMMddmmss") + "MyLogFile.txt"
$itemvalue = "Starting Logging at: " + " " + (get-date)
New-item -path $logpath -name $itemname -ItemType File -value $itemvalue
$logfile = $logpath + $itemname
$logfile


$regpath = "HKCU:\Software\MyCustomSoftware\"
$regname = "BuildTime"
$regvalue = "Build Started At: " + " " + (get-date)
New-itemproperty -path $regpath -name $regname -PropertyType String -value $regvalue
$verifyValue = Get-itemproperty -path $regpath -name $regname 
Write-Host "The $regName named value is set to: " $verifyValue.$regname

$testfolder = test-path "c:\Program Files\MyCustomSoftware\Logs"
#Update The Following Line with the Date/Timestamp of your file
$testfile = test-path "c:\Program Files\MyCustomSoftware\Logs\201503163824MyLogFile.txt"
$testreg = test-path "HKCU:\Software\MyCustomSoftware\"
If ($testfolder) { write-host "Folder Found!" }
If ($testfile) { write-host "File Found!" }
If ($testreg) { write-host "Registry Key Found!" }

To copy and move
les and folders, do the following action:
New-item -path "c:\Program Files\MyCustomSoftware\AppTesting" -ItemType Directory | 
Out-null
New-item -path "c:\Program Files\MyCustomSoftware\AppTesting\Help" -ItemType Directory | 
Out-null
New-item -path "c:\Program Files\MyCustomSoftware\AppTesting\" -name AppTest.txt -ItemType File | 
out-null
New-item -path "c:\Program Files\MyCustomSoftware\AppTesting\Help\" -name HelpInformation.txt -ItemType File |
out-null
New-item -path "c:\Program Files\MyCustomSoftware\" -name ConfigFile.txt -ItemType File | 
out-null 
move-item -path "c:\Program Files\MyCustomSoftware\AppTesting" -destination "c:\Program Files\MyCustomSoftware\Archive" -force
copy-item -path "c:\Program Files\MyCustomSoftware\ConfigFile.txt" "c:\Program Files\MyCustomSoftware\Archive\Archived_ConfigFile.txt" -force

 # Get File Attributes
 $file = get-item -path "c:\Program Files\MyCustomSoftware\Graphics\FirstGraphic.png"
 $attributes = $file.attributes
 # Convert attributes to string
 $attributes = $attributes.tostring()
 # Split individual attributes into array
 $attributes = $attributes.split(",")
 # Read through the individual attributes
 Foreach ($attribute in $attributes) { 
# If read Only, skip 
if ($attribute -like "*ReadOnly*") {  
    write-host "Skipping Attribute: $attribute" } 
# Else add attribute to attribute list 
else { 
    $newattribute += "$attribute,"  
    Write-Host "Attribute Added: $attribute" }}
    # Remove the trailing comma
    $newattribute = $newattribute.trimend(",")
    # Write over existing attributes with new attributes
    $file.attributes = $newattribute 
    Write-host "New File attributes are: " $file.attributes

    # Get the existing ACL on the FirstGraphic.png file
    $fileACL = get-acl -path "c:\Program Files\MyCustomSoftware\Graphics\FirstGraphic.png"
    # Set the ACL from FirstGraphic.png on SecondGraphic.png 
    Set-acl -path "c:\Program Files\MyCustomSoftware\Graphics\SecondGraphic.png" -aclobject $fileACL
    # Get the existing ACL on the Logs directory
    $dirACL = get-acl -path "c:\Program Files\MyCustomSoftware\Logs"
    # Set the ACL from the Logs directory on the Graphics directory
    Set-acl -path "c:\Program Files\MyCustomSoftware\Graphics" -aclobject $dirACL
    # Get the existing ACL from the ConnectionInformation key
    $regACL = get-acl -path "HKCU:\Software\MyCustomSoftware\ConnectionInformation"
    # Set the ACL from ConnectionInformation on the AppSettings key
    Set-acl -path "HKCU:\Software\MyCustomSoftware\AppSettings" -aclobject $regACL


     # Get the ACL from the Graphics directory
     $ACL = Get-Acl "c:\program files\MyCustomSoftware\Graphics"
     # Search the updated ACL for the Everyone group
     $ACL.access | where { $_.IdentityReference -contains "Everyone" }
     # Populate group variable for permissions
     $group = "Everyone"
     # Populate the permissions variable for setting permissions
     $permission = "FullControl, Synchronize"
     # Designate the inheritance information for permissions
     $inherit = [system.security.accesscontrol.InheritanceFlags]"ContainerInherit, ObjectInherit"
     # Designate the propagation information for permission propagation
     $propagation = [system.security.accesscontrol.PropagationFlags]"None"
     # Set to Allow Permissions
     $accesstype = "Allow"
     # Create the New Access Control list Rule
     $Rule = New-Object system.security.accesscontrol.filesystemaccessrule($group,$permission,$inherit,$propagation,$accesstype)
     # Merge new permissions with the existing ACL object
     $ACL.SetAccessRule($RULE)
     # Set the ACL on folder
     Set-Acl -path "c:\program files\MyCustomSoftware\Graphics" -aclobject $Acl
     # Get Updated ACL on folder
     $ACL = Get-Acl "c:\program files\MyCustomSoftware\Graphics"
     # Search the updated ACL for the Everyone group
     $ACL.access | where { $_.IdentityReference -contains "Everyone" }


     # Get the ACL from the ConnectionInformation registry key
     $ACL = Get-Acl "HKCU:\Software\MyCustomSoftware\ConnectionInformation"
     # Search the updated ACL for the Everyone group
     $ACL.access | where { $_.IdentityReference -contains "Everyone" }
     # Populate group variable for permissions
     $group = "Everyone"
     # Populate the permissions variable for setting permissions
     $permission = "FullControl"
     # Set to Allow Permissions
     $accesstype = "Allow"
     # Create the New Access Control list Rule
     $Rule = New-Object system.security.accesscontrol.RegistryAccessrule($group,$permission,$accesstype)
     # Merge new permissions with the existing ACL object
     $ACL.SetAccessRule($RULE)
     # Set the ACL on registry key
     Set-Acl -path "HKCU:\Software\MyCustomSoftware\ConnectionInformation" -aclobject $Acl
     # Get Updated ACL on registry key
     $ACL = Get-Acl "HKCU:\Software\MyCustomSoftware\ConnectionInformation"
     # Search the updated ACL for the Everyone group
     $ACL.access | where { $_.IdentityReference -contains "Everyone" }

     $classProperties = (get-cimclass -class win32_Printer).CimClassProperties
     $classProperties.count

     Get-cimclass win32_Environment | select -ExpandProperty 
     CimClassProperties | where {$_.Qualifiers -match "write"}

     Get-cimclass win32_Environment | select -ExpandProperty 
     CimClassProperties | where {$_.Qualifiers -notmatch "write"} | select -ExpandProperty Name

     Get-CimInstance Win32_Environment


      # Update the Domain\Username with valid credentials
      New-CimInstance Win32_Environment -Property @{Name="PurchasedDate";VariableValue="10/17/2015"; 
      UserName="DOMAIN\USERNAME"}
      Get-Ciminstance Win32_Environment | Where {$_.name -match "PurchasedDate"}

      $instance = Get-Ciminstance win32_environment | Where {$_.name -match "PurchasedDate"}
      Remove-ciminstance -ciminstance $instance
      Get-Ciminstance win32_environment | Where {$_.name -match "PurchasedDate"}

      get-cimclass win32_process | select -ExpandProperty CimClassMethods

      Invoke-CimMethod Win32_Process -MethodName "Create" -Arguments @{ CommandLine = 'mspaint.exe'}
      Invoke-CimMethod -Query 'select * from Win32_Process where name like "mspaint.exe"' -MethodName "Terminate"

      $y = if($false) {1} else {2}

invoke-command -ComputerName (Get-Content .\servers.txt) {commands}

foreach ($s in (Get-Content .\servers.txt)) {Invoke-Command -ComputerName $s {commands}}