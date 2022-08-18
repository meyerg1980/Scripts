function Get-MyVMs($Server){
    Write-Host "the HyperV server name that was passed to the function is: " $Server
    Write-Host "The virtual Machines on this server are:"
    get-vm -computername $Server
}

#script body starts here
cls
$Server = "HyperV"
Get-MyVMs $Server

function Get-MyVMs($Server, $VM){
    Write-Host "the HyperV server name that was passed to the function is: " $Server
    Write-Host "The name of the virtual machine that was passed to the function is: " $VM 
    Write-Host "The virtual Machines on this server are:"
    get-vm -computername $Server $VM
}

#script body starts here
cls
$Server = "HyperV"
$VM = "VM1"
Get-MyVMs $Server $VM
