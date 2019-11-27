#!/bin/bash
echo 'Checks for headers and add  headers if not present!!'
echo
source='/home/prav/windows_combined_csv_records/windows_combined'
if [ ! -f "$source" ];then
   touch /home/prav/windows_combined_csv_records/windows_combined
fi
 
mv /home/prav/windows_combined_csv_records/windows_combined /home/prav/windows_combined_csv_records/windows_combined_$(date +%F-%H-%M-%S)
if [ $? -eq 0 ];then
#cat /tmp/to/*/C:/Users/praveen/Desktop/itop_stuff/dataholder >/home/prav/windows_combined_csv_records/windows_combined
awk 'FNR==1{print ""}1' /tmp/to/*/C:/Users/praveen/Desktop/itop_stuff/dataholder >/home/prav/windows_combined_csv_records/windows_combined
if [ $? -eq 0 ];then
    a=$'"Name","Organization->Name","CPU","RAM","Description","Additional Notes","OS family->Name","OS version->Name","Business criticality","Status","Assigned IPs Info"'
    #a=$'"Name","Organization->Name","RAM","CPU","Description","OS family->Name","OS version->Name","Business criticality","Status"'
    egrep -w "^${a}" /home/prav/windows_combined_csv_records/windows_combined
    if [ $? -ne 0 ];then
        #b=$(echo $'"Name","Organization->Name","RAM","CPU","Description","OS family->Name","OS version->Name","Business criticality","Status"')
        #b=$(echo $'"Name","Organization->Name","RAM","CPU","Description","OS family->Name","OS version->Name","Virtual host->Name","Business criticality","Status","IP"')
        b=$(echo $'"Name","Organization->Name","CPU","RAM","Description","Additional Notes","OS family->Name","OS version->Name","Business criticality","Status","Assigned IPs Info"')
        sed  -i "1i $b" $source
    fi
fi
sed -i 's/20122/2012 R2/g' $source
fi
