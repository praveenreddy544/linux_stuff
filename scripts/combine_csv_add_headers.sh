#!/bin/bash
echo 'Checks for headers and add  headers if not present!!'
echo
source='/home/prav/combined_csv_records/combined'
if [ ! -f "$source" ];then
   touch /home/prav/combined_csv_records/combined
fi
 
mv /home/prav/combined_csv_records/combined /home/prav/combined_csv_records/combined_$(date +%F-%H-%M-%S)
if [ $? -eq 0 ];then
cat /tmp/rd/*/tmp/details.csv >/home/prav/combined_csv_records/combined
if [ $? -eq 0 ];then
    a=$'"Name","Organization->Name","RAM","CPU","Description","Additional Notes","OS family->Name","OS version->Name","Business criticality","Status","Assigned IPs Info"'
    #a=$'"Name","Organization->Name","RAM","CPU","Description","OS family->Name","OS version->Name","Business criticality","Status"'
    egrep -w "^${a}" /home/prav/combined_csv_records/combined
    if [ $? -ne 0 ];then
        #b=$(echo $'"Name","Organization->Name","RAM","CPU","Description","OS family->Name","OS version->Name","Business criticality","Status"')
        #b=$(echo $'"Name","Organization->Name","RAM","CPU","Description","OS family->Name","OS version->Name","Virtual host->Name","Business criticality","Status","IP"')
        b=$(echo $'"Name","Organization->Name","RAM","CPU","Description","Additional Notes","OS family->Name","OS version->Name","Business criticality","Status","Assigned IPs Info"')
        sed  -i "1i $b" $source
    fi
fi
fi
