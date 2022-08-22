#install data center bridging
Install-WindowsFeature -Name data-center-bridging

#accept DCB os configurations
set-netqosdcbxsetting -willing $false

#create traffic class 
new-netqostrafficclass 'smb' -priority 4 -algorithm ETS -bandwidth 50

#enable priority flow control
enable-netqosflowcontrol -priority 4
get-netqosflowcontrol -interfacealias internal

#create qos policy
new-netqospolicy -name 'smb' -SMB -PriorityValue8021Action 4

#enable dcb
Enable-NetAdapterQos -InterfaceDescription 'microsoft'

#disable DCB
Disable-NetAdapterQos -InterfaceDescription 'microsoft'
