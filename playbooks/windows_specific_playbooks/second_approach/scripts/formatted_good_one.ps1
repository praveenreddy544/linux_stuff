$hname = "$env:COMPUTERNAME"
$bytes = (Get-WmiObject -class "cim_physicalmemory" | Measure-Object -Property Capacity -Sum).Sum
$ram_in_gb = $bytes / 1024 / 1024 / 1024
$hname = ([System.Net.Dns]::GetHostByName(($env:computerName))).Hostname
$osname = Get-CimInstance Win32_Operatingsystem | select -expand Caption
$ipr = Test-Connection -ComputerName (hostname) -Count 1  | Select -ExpandProperty IPV4Address
$ip = $ipr.IPAddressToString

echo "`"Ip is $ip`""
echo "`"RAM in GB is --> $ram_in_gb`""
echo "`"Server FQDN is ---> $hname`""
echo "`"osname is ---> $osname`""
