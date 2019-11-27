$hname = "$env:COMPUTERNAME"
$cpu_info = WMIC CPU Get NumberOfLogicalProcessors
echo $cpu_info
$bytes = (Get-WmiObject -class "cim_physicalmemory" | Measure-Object -Property Capacity -Sum).Sum
$ram_in_gb = $bytes / 1024 / 1024 / 1024
echo $ram_in_gb
$hname = ([System.Net.Dns]::GetHostByName(($env:computerName))).Hostname
echo "Server FQDN is ---> $hname"
$osname = Get-CimInstance Win32_Operatingsystem | select -expand Caption
echo "osname is ---> $osname"
$ipr = Test-Connection -ComputerName (hostname) -Count 1  | Select -ExpandProperty IPV4Address
$ip = $ipr.IPAddressToString
echo "Ip is $ip"
