#!/bin/bash

LOGFILE="/home/ubuntu/setup/log.txt"

INSTANCE_TYPE=`curl -q http://169.254.169.254/latest/meta-data/instance-type`
echo $INSTANCE_TYPE >> $INSTANCE_TYPE

echo "$(date) - Running: apt -y update" >> $LOGFILE
sudo apt -y update
echo "$(date) - Running: sudo apt -y upgrade" >> $LOGFILE
sudo apt -y upgrade
