#!/bin/bash
echo -e \""### Server Specific virtual Storage usage info ###"
echo
total_disks=`lshw -class disk -short |grep -i 'virtual'|awk '{print $2}'|wc -l`
total_vg_info=`vgdisplay|grep -i "VG Name"|grep -v "rootvg"|wc -l`
echo "Total no of disks attached to this host: $total_disks"
echo "Total no of application volume groups created on this host: $total_vg_info"
echo
if [ $total_vg_info -eq 0 ];then
   echo " There are no application filesystems"
   echo \"
   exit 0
fi
echo -e "\t Below are application filesystems on this host"
echo
#df -hTP|grep -v 'rootvg'|awk '{ print $7, $3 }' | tail -n +2 > /home/prav/a.txt
df -hTP|egrep -v 'rootvg'|egrep -v 'tmpfs'|egrep -v 'sd.'| tail -n +2 | awk '{ print $7, $3 }' > /home/prav/a.txt
if [ $? -eq 0 ];then
echo "Filesystem_name ---->  Filesystem_Size"
#cat /home/prav/a.txt|tail -n +2
#bash /home/prav/ansible_stuff/playbooks/linux_internal_os_specific/linux_stuff/scripts/parser.sh
bash /tmp/itop_data_import_specific_scripts/parser.sh
#bash /home/prav/ansible_stuff/playbooks/linux_internal_os_specific/linux_stuff/scripts/itop_data_import_specific_scripts/parser.sh
fi
echo \"
