#!/bin/bash
function validate_root_user {
if [[ "$UID" != 0 ]];then
echo -e "\t Exiting Script !! Need to have root(sudo) privilege to run this script"
exit 1
fi
}

function db_users_create() {
##### Setting colors below to reflect in stdout ######
green=`/usr/bin/tput -T xterm setaf 2`
red=`/usr/bin/tput -T xterm setaf 1`
reset=`/usr/bin/tput -T xterm sgr0`
#####################################################

echo
echo "Initiating script"
read -p "Press yes to continue execution or no to exit: " user_input
if [[ $user_input =~ ^[Yy]es$ ]]
then
   # Dictionary holding group names with gid's
   declare -A arr
   arr['db2iadm1']=1001
   arr+=( ['db2fadm1']=1002 ['dasadm1']=1003 ['appadm']=1004 ['wasadm']=1201 ['httpadm']=1401 )
   for key in ${!arr[@]}; do
     #echo ${key} ${arr[${key}]}
     echo
     echo
     groupadd ${key} -g ${arr[${key}]}
     echo ${green}"Group ${key} with gid ${arr[${key}]} added successfully"${reset}
   done 
 
  # Adding users with prompt

   read -p "Enter username to add to gid 1001: " firstuser
   echo "Adding $firstuser to group db2iadm1 which has gid `getent group db2iadm1|cut -d: -f3` "
   useradd -m -d /home/$firstuser -u 1101 -g db2iadm1 -s /bin/bash $firstuser
   echo ${green}"Added $firstuser successfully"${reset}
   echo
   
   read -p "Enter username to add to gid 1002: " seconduser
   echo "Adding $seconduser to group db2fadm1 which has gid `getent group db2fadm1|cut -d: -f3` " 
   useradd -m -d /home/$seconduser -u 1102 -g db2fadm1 -s /bin/bash $seconduser
   echo ${green}"Added $seconduser successfully"${reset}
   echo

   read -p "Enter username to add to gid 1003: " thirduser
   echo "Adding $thirduser to group dasadm1 which has gid `getent group dasadm1|cut -d: -f3` " 
   useradd -m -d /home/$thirduser -u 1103 -g dasadm1 -s /bin/bash $thirduser
   echo ${green}"Added $thirduser successfully"${reset}
   echo
   
   read -p "Enter username to add to gid 1004: " fourthuser
   echo "Adding $fourthuser to group appadm which has gid `getent group appadm|cut -d: -f3` " 
   useradd -m -d /home/$fourthuser -u 1104 -g appadm -s /bin/bash $fourthuser
   echo "Added $fourthuser successfully"
   echo
   
   read -p "Enter username to add to gid 1201: " fifthuser
   echo "Adding $fifthuser to group wasadm which has gid `getent group wasadm|cut -d: -f3` " 
   useradd -m -d /home/$fifthuser -u 1301 -g wasadm -s /bin/bash $fifthuser
   echo ${green}"Added $fifthuser successfully"${reset}
   echo
   
   read -p "Enter username to add to gid 1401: " sixthuser
   echo "Adding $sixthuser to group httpadm which has gid `getent group httpadm|cut -d: -f3` " 
   useradd -m -d /home/$sixthuser -u 1501 -g httpadm -s /bin/bash $sixthuser
   echo ${green}"Added $sixthuser successfully"${reset}
   echo
   
else
     echo "Existing Script as user prompted for No"
fi

}
validate_root_user
db_users_create
