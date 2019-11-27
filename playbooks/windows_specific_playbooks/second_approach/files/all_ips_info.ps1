ipconfig |  select-string "IPv4" >C:\Users\praveen\Desktop\itop_stuff\ipdata
$filename = "C:\Users\praveen\Desktop\itop_stuff\ipdata"
Get-Content $filename | ForEach-Object { $_.split(":")[1] }
