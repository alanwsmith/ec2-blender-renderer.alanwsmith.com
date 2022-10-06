#!/bin/bash

LOGFILE="/home/ubuntu/setup-log.txt"
echo "sudo apt -y update" >> $LOGFILE
sudo apt -y update
echo "Making test files directory" >> $LOGFILE
mkdir -p /home/ubuntu/blender_profiler/test_files
echo "Installing AWS CLI" >> $LOGFILE
sudo snap install aws-cli --classic


echo "Installing Blender dependicies" >> $LOGFILE
sudo apt -y install libxi6
sudo apt -y install libxxf86vm-dev
sudo apt -y install libxfixes-dev
sudo apt -y install libxrender-dev
sudo apt -y install libgl-dev
