#!/bin/bash

LOGFILE="/home/ubuntu/setup-log.txt"


# echo "$(date) - Installing NVIDIA Drivers" >> $LOGFILE
# echo "sudo apt -y install nvidia-headless-515-server" >> $LOGFILE

#Adding these to see if they work for the P series

# got an error with this, but then 'nvidia-headless-515-server'  installed?
# TODO: FIgure this out
# sudo apt -y install nvidia-kernel-common-515-server

# Not sure if there was some DKMS stuff in there too


# Note this was all that was necessary for the G series
# Dropping it for now to see if just installing cuda works
# sudo apt -y install nvidia-headless-515-server

# this is a test for the p2 tests
sudo apt -y install nvidia-dkms-470
sudo apt -y install nvidia-headless-470

#



# echo "$(date) - Installing Cuda Keyring" >> $LOGFILE
# wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-keyring_1.0-1_all.deb
# sudo dpkg -i cuda-keyring_1.0-1_all.deb
# sudo apt-key del 7fa2af80
# sudo apt-get update
# echo "$(date) - Installing Cuda" >> $LOGFILE
# sudo apt -y install cuda

# echo "$(date) - Doing Post Install Steps" >> $LOGFILE
# echo 'export PATH=/usr/local/cuda-11.8/bin${PATH:+:${PATH}}' >> /home/ubuntu/.bashrc
# sudo cp /lib/udev/rules.d/40-vm-hotadd.rules /etc/udev/rules.d
# sudo sed -i '/# Memory hotadd request/d' /etc/udev/rules.d/40-vm-hotadd.rules
# sudo sed -i '/SUBSYSTEM=="memory", ACTION=="add"/d' /etc/udev/rules.d/40-vm-hotadd.rules
# sudo rm /home/ubuntu/cuda-keyring_1.0-1_all.deb

