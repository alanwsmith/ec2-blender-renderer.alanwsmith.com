#!/bin/bash

LOGFILE="/home/ubuntu/setup/log.txt"

echo "$(date) - Installing Cuda" >> $LOGFILE
sudo apt -y install cuda-11-4
