#install docker
Install-Module -name dockermsftprovider -repository psgallery -force
Install-Package -name docker -providername dockermsftprovider -verbose
Restart-Computer -Force

#verify install
docker --version
get-service docker

#run a container 
docker run microsoft/dotnet-samples:dotnetapp-nanoserver-sac2016

#update docker
find-package -name docker -providername dockermsftprovider
install-package -name docker -providername dockermsftprovider -update -force
Start-Service docker