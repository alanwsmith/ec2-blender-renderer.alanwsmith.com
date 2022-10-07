#!/bin/bash

LOGFILE="/home/ubuntu/setup-log.txt"
echo "$(date) - Running: apt -y update" >> $LOGFILE
sudo apt -y update
echo "$(date) - Running: sudo apt -y upgrade" >> $LOGFILE
sudo apt -y upgrade

