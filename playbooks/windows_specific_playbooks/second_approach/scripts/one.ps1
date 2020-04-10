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

$ip=C:\Users\praveen\Desktop\itop_stuff\one.ps1 | Out-String
$total_ips_count=(Get-Content C:\Users\praveen\Desktop\itop_stuff\ipdata | Measure-Object -Line).lines
$tot="Total number of IP's found: $total_ips_count (Below displayed)"

$ips=(echo "$($tot)"`n"$($ip)")

Write-Host "`"$shortname`""-nonewline ',';Write-Host "`"Redmane`"" -nonewline ',';Write-Host "`"$cpuinfo`"" -nonewline ',';Write-Host "`"$ram_in_gb`"" -nonewline ',';Write-Host "`"Server FQDN is ---> $hname`"" -nonewline ',';Write-Host "`"Please login to this windows server to see Partitions/Drives Info`"" -nonewline ',';Write-Host "`"Windows`"" -nonewline ',';Write-Host "`"$os_version`"" -nonewline ',';Write-Host "`"high`"" -nonewline ',';Write-Host "`"production`"" -nonewline ',';Write-Host "`"$ips`""
