#!/bin/bash
declare -A arr
arr['db2iadm1']=1101
arr+=( ['db2fadm1']=1102 ['dasadm1']=1103 ['wasadm']=1104 ['appuser']=1105 )
for key in ${!arr[@]}; do
    echo ${key} ${arr[${key}]}
done

