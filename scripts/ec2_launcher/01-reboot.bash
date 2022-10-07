#!/bin/bash

LOGFILE="/home/ubuntu/setup-log.txt"
echo "$(date) - Making /run/user/1000/gvfs" >> $LOGFILE
mkdir -p /run/user/1000/gvfs
chmod ug+w /run/user/1000/gvfs
echo "$(date) - Running: apt -y update" >> $LOGFILE
sudo apt -y update
echo "$(date) - Running: sudo apt -y upgrade" >> $LOGFILE
sudo apt -y upgrade

