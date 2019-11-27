#!/bin/bash
source='/home/prav/a.txt'
while read p; do
    filesystem_name=$(echo $p |awk '{print $1}')
    filesystem_total_size=$(echo $p |awk '{print $2}')
   
    echo "$filesystem_name ---> $filesystem_total_size"
done < $source

