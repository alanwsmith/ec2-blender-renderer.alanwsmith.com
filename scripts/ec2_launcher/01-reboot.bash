#!/bin/bash

LOGFILE="/home/ubuntu/setup-log.txt"
echo "Making /run/user/1000/gvfs" >> $LOGFILE
mkdir -p /run/user/1000/gvfs
chmod ug+w /run/user/1000/gvfs
echo "sudo apt -y update" >> $LOGFILE
sudo apt -y update
echo "sudo apt -y upgrade" >> $LOGFILE
sudo apt -y upgrade

