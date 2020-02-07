#!/bin/bash
a=$(sudo pvs|grep datavg|wc -l)
#a=2
if [ $a == 1 ]
then
    vgextend datavg  /dev/sdc /dev/sdd /dev/sde /dev/sdf
else
    echo "exiting script"
fi
