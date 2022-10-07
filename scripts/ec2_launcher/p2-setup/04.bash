#!/bin/bash

LOGFILE="/home/ubuntu/setup/log.txt"

echo "$(date) - Installing Cuda" >> $LOGFILE
sudo apt -y install cuda-drivers-470
