#!/bin/bash
ROOT_PWD=`date +%s | sha256sum | base64 | head -c 32| cut -c1-8`
echo "Changing root password"
echo $ROOT_PWD | passwd --stdin root


b=`vault login -method="userpass" username="chem" password="chem" |grep -w token|grep -vi '^[succes|already|login]'|cut -d ' ' -f2-`
a=`echo "${b}" | sed -e 's/^[ \t]*//'`

data_str={\"username\":\"root\",\"password\":\"${ROOT_PWD}\"}


eval $(echo "curl http://127.0.0.1:8200/v1/kv/LinuxOS/ROOTPWD --request POST --header \"X-Vault-Token: ${a}\" --data '"${data_str}"'")
echo "Root password has been saved to Vault location"

# Get Data using GET http method

#readpwd=`curl -s -H "X-Vault-Token: ${a}" -X GET http://127.0.0.1:8200/v1/kv/LinuxOS/ROOTPWD`
#echo $readpwd
#rpd=$(echo $readpwd | jq '.data.password'| sed 's/"//g')
#echo "Root Password is --> $rpd"

