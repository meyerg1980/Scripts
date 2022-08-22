
#run outside function from powershell using all paramters & = invocation parameter
$exe = "func"
$action = "new"
$language = "powershell"
$template = "HttpTrigger"
$name = "myFunc"
& $exe $action -l $language -t $template -n $name

#pass the parameter directly to cmd line
func new -t HttpTrigger -n --% "MyFunc"





