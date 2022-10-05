#!/bin/bash

LOGFILE="/home/ubuntu/setup-log.txt"

echo "Starting script 02" >> $LOGFILE
echo "Installing: nvidia-headless-515-server" >> $LOGFILE
sudo apt -y install nvidia-headless-515-server
echo "Finished script 02" >> $LOGFILE


