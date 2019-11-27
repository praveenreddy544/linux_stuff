#!/bin/bash
all_ips=`hostname -I | tr -s " " "\012"`
tot_ips=`echo "$all_ips" | wc -l `

echo -e "\t Total number of IP's found: $tot_ips (Below displayed) "
echo
echo "$all_ips"
