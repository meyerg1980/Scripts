function   Display-Helloworld {
    #this is the funstion
    Write-Host "PowerShell is executing the function"   
    Write-Host "hello World"
}
#this is the main body
Write-Host "The main body is executing"
cls
Write-Host "PowerShell is about to call the function"
Display-Helloworld
Write-Host "The script has returned to the main body"

