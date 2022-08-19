#create a module in prgram files for the jea role
$modulepath = "env:programfiles\windowspowershell\modules\jearoles"
New-Item $modulepath -ItemType Directory -Force
New-ModuleManifest -Path (Join-Path $modulepath "jearoles.psd1") -Description "Custom JEA role capabilties"

#create direcoty for the role capabilities
$rolecapabilitypath = Join-Path $modulepath "RoleCapabilties"
New-Item $rolecapabilitypath -ItemType Directory

#create the dns jradmin role capabiilty
New-PSRoleCapabilityFile -path (Join-Path $rolecapabilitypath "dnsjradmin.psrc") -VisibleCmdlets "dnsserver\get-*"

#create the dns admin role capabilty 
New-PSRoleCapabilityFile -path (Join-Path $rolecapabilitypath "dnsadmin.psrc") `
                        -VisibleCmdlets "dnsserver\=", @{name = "restart-service"; parameters = @{ name = "name"; validateset = "dns"}}

