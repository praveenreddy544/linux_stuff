#!/bin/bash

 file_check()
{
    a=$(cat /home/prav/itop_status_file |  head -n 1)
    echo $a | grep -v '0' > /dev/null
    if [ $? -eq 0 ]; then
       echo 'Looks there are issues in itop import csv file !! Please fix and proceed '
    fi
}
     
source='/home/prav/itop_status_file'
if [ ! -f "$source" ];then
     echo "No itop import log file to mail"
else
    file_check
fi
