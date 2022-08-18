#docker startup options
start http://docs.microsoft.com/en-us/virtualization/windowsconatiners/manage-docker/configure-docker-daemon

#view docker system info
docker info

#remove exisitng images
docker system prune try --all  

#create a config file
'{"data-root": "A:\\Docker"."group":devops}' | Out-File C:\ProgramData\docker\config\daemon.json

-Service docker