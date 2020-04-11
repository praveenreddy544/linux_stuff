#!/bin/bash
#echo {{ passwd }}|realm join --user=chintu ad
passwd='Saritha@123'
echo $passwd|realm join --user=chintu ad
