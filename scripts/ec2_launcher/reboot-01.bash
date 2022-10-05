#!/bin/bash

LOGFILE="/home/ubuntu/setup-log.txt"

echo "Starting script 01" >> $LOGFILE
sudo apt -y update
sudo apt -y upgrade
echo "Completed update and upgate" >> $LOGFILE

# 

