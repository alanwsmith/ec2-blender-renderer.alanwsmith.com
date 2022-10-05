#!/bin/bash

LOGFILE="/home/ubuntu/setup-log.txt"

echo "Starting script 03" >> $LOGFILE
echo "Installing: nvidia-cuda-toolkit" >> $LOGFILE
sudo apt -y install nvidia-cuda-toolkit
echo "Finished script 03" >> $LOGFILE


