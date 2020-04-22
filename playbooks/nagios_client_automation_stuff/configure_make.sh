#!/bin/bash
egrep -i '5666/tcp' /etc/services
if [ $? -ne 0 ]
then
    cd /root/nagios_stuff/nrpe-nrpe-3.2.1
    /root/nagios_stuff/nrpe-nrpe-3.2.1/configure --enable-command-args
    make all

    make install-groups-users
    make install
    make install-config

#egrep -i '5666/tcp' /etc/services
#if [ $? -ne 0 ]
#then
    echo >> /etc/services
    echo '# Nagios services' >> /etc/services
    echo 'nrpe    5666/tcp' >> /etc/services
    make install-init
else
    echo "your nrpe service is already configured!! So exiting config part of nrpe"
fi

