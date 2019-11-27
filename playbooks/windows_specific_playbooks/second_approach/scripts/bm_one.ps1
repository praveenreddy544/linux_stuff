$shortname = "$env:COMPUTERNAME"

$cpuinfo=(Get-CimInstance Win32_ComputerSystem).NumberOfLogicalProcessors

$d = Get-CimInstance Win32_Operatingsystem | select -expand Caption | Select-String -Pattern '\d' -AllMatches | % { $_.Matches } | % { $_.Value }
$e = echo "`"$d`""
$f = $e -replace '\s',''
$os_version = $f -replace '"', ""



$bytes = (Get-WmiObject -class "cim_physicalmemory" | Measure-Object -Property Capacity -Sum).Sum
$ram_in_gb = $bytes / 1024 / 1024 / 1024
$hname = ([System.Net.Dns]::GetHostByName(($env:computerName))).Hostname
$osname = Get-CimInstance Win32_Operatingsystem | select -expand Caption

$ips=C:\Users\praveen\Desktop\itop_stuff\one.ps1 | Out-String
#$ipr = Test-Connection -ComputerName (hostname) -Count 1  | Select -ExpandProperty IPV4Address
#$ip = $ipr.IPAddressToString

#Write-Host "`"$shortname`""-nonewline ',';Write-Host "`"Redmane`"" -nonewline ',';Write-Host "`"$cpuinfo`"" -nonewline ',';Write-Host "`"$ram_in_gb`"" -nonewline ',';Write-Host "`"Server FQDN is ---> $hname`"" -nonewline ',';Write-Host "`"Windows`"" -nonewline ',';Write-Host i`"$os_version`"" -nonewline ',';Write-Host "`"$ip`""

Write-Host "`"$shortname`""-nonewline ',';Write-Host "`"Redmane`"" -nonewline ',';Write-Host "`"$cpuinfo`"" -nonewline ',';Write-Host "`"$ram_in_gb`"" -nonewline ',';Write-Host "`"Server FQDN is ---> $hname`"" -nonewline ',';Write-Host "`"Please login to Server to see Partitions/Drive Info`"" -nonewline ',';Write-Host "`"Windows`"" -nonewline ',';Write-Host "`"$os_version`"" -nonewline ',';Write-Host "`"high`"" -nonewline ',';Write-Host "`"production`"" -nonewline ',';Write-Host "`"$ips`"" -nonewline
