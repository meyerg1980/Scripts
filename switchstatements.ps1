# echo key press without a switch

$a = Read-Host "Enter a letter from A to D"
Write-Host "you tyyped" $a


# a simple switch example

$a = Read-Host "Enter a letter from A to D"
switch ($a) {
    A{Write-Host "You typed A"}
    B{Write-Host "You typed B"}
    C{Write-Host "You typed C"}
    default{Write-Host "You typed an invalid letter"}
}

#more complex complex switch

$a = Read-Host "Enter a letter from A to D"
$B = Read-Host "Enter a second letter from A to D"
switch ($a, $b) 
{
    A{Write-Host "You typed A"}
    B{Write-Host "You typed B"}
    C{Write-Host "You typed C"}
    D{Write-Host "You typed D"}
    Default {Write-Host "You typed an invalid letter"}
}