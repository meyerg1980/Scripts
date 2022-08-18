#install docker
Install-Module -Name DockerMsftProvider -Repository PSGallery -Force
Install-Package -Name Docker -ProviderName DockerMsftProvider -Verbose
Restart-Computer -Force

#verify install
docker --version
Get-Service docker

#run a container
docker run microsoft/dotnet-samples:dotnetapp-nanoserver-sac2016

#update docker
Find-Package -Name Docker -ProviderName DockerMsftProvider
Install-Package -Name Docker -ProviderName DockerMsftProvider -update -Force
Start-Service docker

Get-Module

get-command "*package*"

unInstall-Module -Name DockerMsftProvider -Repository PSGallery -Force
unInstall-Package -Name Docker -ProviderName DockerMsftProvider -Verbose