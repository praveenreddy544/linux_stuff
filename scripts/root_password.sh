#!/bin/bash
echo "Changing root password"
ROOT_PWD="onetwothree"
#echo $ROOT_PWD | passwd --stdin root

b=`vault login -method="userpass" username="chem" password="chem" |grep -w token|grep -vi '^[succes|already|login]'|cut -d ' ' -f2-`
#echo $a
a=`echo "${b}" | sed -e 's/^[ \t]*//'`

#echo "curl -H "X-Vault-Token: ${a}" -X GET http://127.0.0.1:8200/v1/kv/databases/twing"
#curl http://127.0.0.1:8200/v1/kv/mypasswords/os --request POST --header "X-Vault-Token: ${a}" --data '{"adder": "iam","username":"root","password":"${ROOT_PWD}"}'


data_str={\"username\":\"root\",\"password\":\"${ROOT_PWD}\"}
#echo $data_str

#$overall_string="curl http://127.0.0.1:8200/v1/kv/LinuxOS/ROOTPWD --request POST --header \"X-Vault-Token: ${a}\" --data '"${data_str}"'"
#$overall_string="curl http://127.0.0.1:8200/v1/kv/LinuxOS/ROOTPWD --request POST --header \"X-Vault-Token: ${a}\" --data '${data_str}'"
#echo $overall_string

#echo "curl http://127.0.0.1:8200/v1/kv/LinuxOS/ROOTPWD --request POST --header "X-Vault-Token: ${a}" --data '"${data_str}"'"
eval $(echo "curl http://127.0.0.1:8200/v1/kv/LinuxOS/ROOTPWD --request POST --header \"X-Vault-Token: ${a}\" --data '"${data_str}"'")
#curl http://127.0.0.1:8200/v1/kv/LinuxOS/ROOTPWD --request POST --header \"X-Vault-Token: ${a}\" --data '"${data_str}"'


# Get Data using GET http method

#curl -H "X-Vault-Token: ${a}" -X GET http://127.0.0.1:8200/v1/kv/LinuxOS/ROOTPWD

