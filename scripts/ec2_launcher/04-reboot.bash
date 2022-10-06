#!/bin/bash

LOGFILE="/home/ubuntu/setup-log.txt"
echo "Getting cuda-keyring_1.0-1_all.deb" >> $LOGFILE
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-keyring_1.0-1_all.deb
sudo dpkg -i cuda-keyring_1.0-1_all.deb
sudo apt-key del 7fa2af80
sudo apt-get update
echo "sudo apt-get -y install cuda" >> $LOGFILE
sudo apt -y install cuda
