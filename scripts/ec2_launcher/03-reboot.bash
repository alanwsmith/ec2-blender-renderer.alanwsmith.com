#!/bin/bash

LOGFILE="/home/ubuntu/setup-log.txt"
echo "sudo apt -y install nvidia-headless-515-server" >> $LOGFILE
sudo apt -y install nvidia-headless-515-server

