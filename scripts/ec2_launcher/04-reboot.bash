#!/bin/bash

LOGFILE="/home/ubuntu/setup-log.txt"
echo "Getting cuda-keyring_1.0-1_all.deb" >> $LOGFILE
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-keyring_1.0-1_all.deb
sudo dpkg -i cuda-keyring_1.0-1_all.deb
sudo apt-key del 7fa2af80
sudo apt-get update
echo "sudo apt-get -y install cuda" >> $LOGFILE
sudo apt -y install cuda
echo 'export PATH=/usr/local/cuda-11.8/bin${PATH:+:${PATH}}' >> /home/ubuntu/.bashrc
sudo cp /lib/udev/rules.d/40-vm-hotadd.rules /etc/udev/rules.d
sudo sed -i '/# Memory hotadd request/d' /etc/udev/rules.d/40-vm-hotadd.rules
sudo sed -i '/SUBSYSTEM=="memory", ACTION=="add"/d' /etc/udev/rules.d/40-vm-hotadd.rules
