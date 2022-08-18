Get-ADGroup -Filter * -Properties Name | Select-Object Name 

Get-ADGroupMember -Identity "Domain Admins"

Get-ADUser gmeyer80 -Properties memberof | Select-Object Name, memberof

New-ADGroup -Name "Miami" -GroupCategory security -GroupScope global

Get-ADGroup Miami

Get-ADGroup Miami | Add-ADGroupMember -Members user23

 Get-ADGroup Miami -Properties Members | Select-Object Members

 Get-ADUser -Filter {Office -eq "Miami"}

 $adusers = Get-ADUser -Filter {Office -eq "Miami"}
 Get-ADGroup Miami | Add-ADGroupMember -Members $adusers

 Remove-ADGroup Miami

 Enable-PSRemoting


