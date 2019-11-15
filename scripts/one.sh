#!/bin/bash
echo "`hostname`,Redmane,`nproc`,`free -g |awk '{print $2}' |grep -v 'used'|paste -s -d+ |bc`,Server FQDN is ---> `hostname -f`,`cat /etc/redhat-release |cut -d' ' -f 1`,`cat /etc/redhat-release |cut -d' ' -f 4|cut -d'.' -f 1,2`,high,implementation" >/home/prav/details.csv
