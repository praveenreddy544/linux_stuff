#!/bin/bash

green=`/usr/bin/tput -T xterm setaf 2`
red=`/usr/bin/tput -T xterm setaf 1`
reset=`/usr/bin/tput -T xterm sgr0`

function validate_root_user() {
if [[ "$UID" != 0 ]];then
echo -e "\t ${red}Exiting Script !! Need to have root(sudo) privilege to run this script${reset}"
exit 1
fi
}

function backup() {
    #source_dir='/opt/linux_yum_repos/'
    source_dir='/var/www/html/re/'
    destination_dir='/opt/repos_bkup'
    output_file='/opt/repos_bkup/copy_status'

    echo -e "\t ${green}This script backsup existing repos before initiating sync from azure cloud rhui repos${reset}"
    if [ ! -d "$destination_dir" ];then
       mkdir -p $destination_dir
    fi

    rsync  -razX --progress $source_dir $destination_dir > $output_file
    if [ $? -eq 0 ];then
      echo "Successfully Synced repos from prime location ${green}$source_dir${reset} to backup location ${green}$destination_dir${reset}"
    else
      echo "${red}Looks like errors during rsync! Please look and re-run this script${reset}"
    fi
}

function yum_repos_sync_remote() {
    echo
    echo
    echo -e "\t ${green}Syncing remote azure cloud repos to yum server${reset}"
    echo "Cleaning yum cache"
    yum clean all
    repos_list="base epel extras openlogic updates"
    for i in $repos_list;do
      reposync -g -l -d -m -n --repoid=$i --download-metadata --download_path=$source_dir > $source_dir$i/reposync_status
      if [ $? -ne 0 ];then
         echo "Errors in syncing repo $source_dir$i from remote location"
      fi

      createrepo -v $source_dir/$i/ > $source_dir$i/createrepo_status
      if [ $? -ne 0 ];then
         echo "Errors in creating repo format for  $source_dir$i!! Please look into and fix before continuing"
      fi
    done
}

validate_root_user
backup
yum_repos_sync_remote
