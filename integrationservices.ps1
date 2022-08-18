#view integration services
Get-VMIntegrationService -ComputerName fs1 -VMName vm1

#enable integration service
Enable-VMIntegrationService -ComputerName fs1 -VMName vm1 -Name "Guest Service Interface"

#enter session
Enter-PSSession -ComputerName fs1

#copy file
Copy-VMFile -vm (Get-VM vm1) -SourcePath c:\file.dat -DestinationPath c:\ -FileSource Host 

Exit-PSSession

#disable int service
Disable-VMIntegrationService -ComputerName fs1 -VMName vm1 -Name "Guest Service Interface"

