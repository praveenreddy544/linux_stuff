#!/bin/bash
echo "This script moves cloud repos"
cd /etc/yum.repos.d/
mv CentOS-*.repo ~/
mv OpenLogic.repo ~/

echo "Moved all repos"
