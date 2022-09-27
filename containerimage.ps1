#docker image repo
start https://hub.docker.com 

#base nano server
docker pull mcr.microsoft.com/windows/nanoserver                                        

#base nano server container image
docker pull microsoft.com/windows/nanoserver:10.0.14393.1066

docker pull cirrusci/windowsservercore

#local image repo
docker images

#get cli help
docker --help          
