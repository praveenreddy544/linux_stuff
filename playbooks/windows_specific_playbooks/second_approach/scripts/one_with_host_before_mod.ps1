$hname = "$env:COMPUTERNAME"
$bytes = (Get-WmiObject -class "cim_physicalmemory" | Measure-Object -Property Capacity -Sum).Sum
$ram_in_gb = $bytes / 1024 / 1024 / 1024
$hname = ([System.Net.Dns]::GetHostByName(($env:computerName))).Hostname
$osname = Get-CimInstance Win32_Operatingsystem | select -expand Caption
$ipr = Test-Connection -ComputerName (hostname) -Count 1  | Select -ExpandProperty IPV4Address
$ip = $ipr.IPAddressToString

Write-Host "`"Ip is $ip`"" 
Write-Host "`"RAM in GB is --> $ram_in_gb`""
Write-Host "`"Server FQDN is ---> $hname`""
Write-Host "`"osname is ---> $osname`""
