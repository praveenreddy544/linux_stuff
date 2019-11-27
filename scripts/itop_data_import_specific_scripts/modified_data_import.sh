#!/bin/bash
#Desc=`/bin/bash /home/prav/ansible_stuff/playbooks/linux_internal_os_specific/linux_stuff/scripts/custom_desc_wrappher.sh`
#Dinfo=`/bin/bash /home/prav/ansible_stuff/playbooks/linux_internal_os_specific/linux_stuff/scripts/itop_data_import_specific_scripts/custom_desc_wrappher.sh`
Dinfo=`/bin/bash /tmp/itop_data_import_specific_scripts/custom_desc_wrappher.sh`
hname=\"`hostname`\"
oname=\"'Redmane'\"
cpuno=\"`nproc`\"
meminfo=\"`free -g |awk '{print $2}' |grep -v 'used'|paste -s -d+ |bc`\"
fqd=\""Server FQDN is ---> `hostname -f`"\"
#fn=\"`cat /etc/redhat-release |cut -d' ' -f 1`\"
#vn=\"`cat /etc/redhat-release |cut -d' ' -f 4|cut -d'.' -f 1,2`\"
fn=\"`hostnamectl |grep -i "Operating System"|cut -d ':' -f2|cut -d ' ' -f2,3|tr -d ' '`\"
#vn=\"`cat /etc/redhat-release | awk '{print $(NF-1)}'|cut -d '.' -f1,2`\"
vn=\"`cat /etc/redhat-release | awk '{print $(NF-1)}'`\"
#ipinfo=\"`hostname -I | awk '{print $1}'`\"
fstep=`/bin/bash /tmp/itop_data_import_specific_scripts/ip_info.sh`
sstep=\"`echo "$fstep"`\"
ipinfo=`echo "$sstep"`
status=\"'high'\"
#ty=\"'implementation'\"
ty=\"'production'\"

#echo $hname,$oname,$cpuno,$meminfo,$fqd,"$Dinfo",$fn,$vn,$vh,$status,$ty,$ipinfo >/tmp/details.csv
echo $hname,$oname,$cpuno,$meminfo,$fqd,"$Dinfo",$fn,$vn,$status,$ty,"$ipinfo" >/tmp/details.csv
