#enables calendar access for default mailbox policy
get-OwaMailBoxPolicy -identity defualt -CalendarEnabled $true
set-OwaMailBoxPolicy -identity deault -?

#https://docs.microsoft.com/en-us/module/exchange/client-access/set-owamailboxpolicy?view=exchange*ps
set-mailboxcalendarconfiguration -identity gmeyer@meyersec.onmicrosoft.com -workinghourstimezone "Central Standard Time"
get-mailboxcalendarconfiguration -identity gmeyer@meyersec.onmicrosoft.comm

set-mailboxcalendarconfiguration -identity gmeyer -workinghoursstarttime 07:00:00
set-mailboxmessageconfiguration gmeyer@meyersec.onmicrosoft.com -alwaysshowbcc $true
set-mailboxspellconfiguration -identity gmeyer -ignoreuppercase $true
set-mailboxspellconfiguration -identity gmeyer -ignoremixeddigits $true

set-clutter -identity gmeyer -enabled $false
set-focusedinbox -identity gmeyer -focusedinboxon $true

get-resorceconfig -resourceporprtyschema room/whiteboard,equipment/van

set-mailbox -identiy wesconfrm@meyersec.onmicrosoft.com -resourcecustom whiteboard
get-mailbox -identiy wesconfrm@meyersec.onmicrosoft.com | fl
set-mailbox -identity donference@meyersec.onmicrosoft.com -resourcecustom $null

$rolegroup = get-rolegroup "organization management"

new-rolegroup "limited organization mangement" -roles $rolegroup.roles -members "gmeyer","otheruse" -managedby "gmeyer"
get-rolegroup "limited organization management" | fl 

update-rolegroup -identity "help desk" -members "gmeyer"
update-rolegroupmember -identity "help desk" -members @[add="gmeyer"; Remove= "other user"]

remove-rolegroup -identity "training administrators"

new-OwaMAilBoxPolicy -name "c levelexecs"

get-OwaMailboxPolicy | fl | Out-File mailpolicy.txt

set-casmailbox -identity gmeyer@meyersec.onmicrosoft.com -OwaMailBoxPolicy "c-levelexecs2"
get-casmailbox -identity gmeyer@meyersec.onmicrosoft.com -OwaMailBoxPolicy "c-levelexecs2"


$mgmt = get-user -resultsize unlimited -filter {(recipienttype -eq 'usermailbox') -and (title -like '*manager*' -or title -like '*executive*')} 
$mgmt | foreach {set-casmailbox -identity $_.microsoftonlineservicesID =owamailboxpolicy "managers and executives"} 

$mgrs = Get-Content "c:\management.txt"
$mgrs | foreach {set-casmailbox -identity $_.microsoftonlineservicesID =owamailboxpolicy "managers and executives"}

get-casmailbox -identity "gmeyer" | fl owamailboxpolicy
get-casmailbox -resultsize unlimited | ft name,owamailboxpolicy -AutoSize

set-casmailbox -identity gmeyer@meyersec.onmicrosoft.com -OwaMailBoxPolicy $null
set-casmailbox -identity gmeyer@meyersec.onmicrosoft.com -OwaMailBoxPolicy "OwaMailboxPolicy-Default"

remove-OwaMailboxPolicy -identity "Sales Associate"

set-OwaMailboxPolicy -identity Default -calendarenables $true