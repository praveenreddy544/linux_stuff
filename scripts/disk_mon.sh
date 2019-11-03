#!/bin/bash
#echo "### On linux server `hostname` ###"
THRUSHOLD_VALUE=1
green=`/usr/bin/tput -T xterm setaf 2`
red=`/usr/bin/tput -T xterm setaf 1`
reset=`/usr/bin/tput -T xterm sgr0`
df -hTP|grep datavg|awk '{ print $7, $6 }'|sed -n '1!p' >/home/chintu/a.txt
filename='/home/chintu/a.txt'
while read p; do
    filesystem_name=$(echo $p |awk '{print $1}')
    usuage=$(echo $p |awk '{print $2}'|tr -d '%') ### append percentage at last
    if [ $usuage -gt $THRUSHOLD_VALUE ];
    then
        usuage+=%
        echo "### filesystem stats on server ${green}`hostname -f`${reset} ###"
        echo "filesystem  ${red}$filesystem_name${reset} on linux server ${green}`hostname`${reset} is currenlty at ${red}$usuage${reset} consumption"
    fi
done < $filename
