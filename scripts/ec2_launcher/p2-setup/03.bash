#!/bin/bash

LOGFILE="/home/ubuntu/setup/log.txt"

echo "$(date) - Installing Cuda Keyring" >> $LOGFILE
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-keyring_1.0-1_all.deb
sudo dpkg -i cuda-keyring_1.0-1_all.deb
sudo apt-key del 7fa2af80
sudo apt -y update
# You have to install cuda first then
# the 470 drivers in the next step
# since cuda installs 520 which aren't
# compatiable with the K80 cards in the
# p2 instances
sudo apt -y install cuda-11-4
# Could also experiment with cuda-11-2
# to see if that just works
rm cuda-keyring_1.0-1_all.deb

