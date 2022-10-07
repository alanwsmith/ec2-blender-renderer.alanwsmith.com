#!/bin/bash

LOGFILE="/home/ubuntu/setup-log.txt"

echo "$(date) - Installing Cuda Keyring" >> $LOGFILE
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-keyring_1.0-1_all.deb
sudo dpkg -i cuda-keyring_1.0-1_all.deb
sudo apt-key del 7fa2af80
sudo apt-get update
echo "$(date) - Installing Cuda" >> $LOGFILE
sudo apt -y install cuda

echo "$(date) - Doing Post Install Steps" >> $LOGFILE
echo 'export PATH=/usr/local/cuda-11.8/bin${PATH:+:${PATH}}' >> /home/ubuntu/.bashrc
sudo cp /lib/udev/rules.d/40-vm-hotadd.rules /etc/udev/rules.d
sudo sed -i '/# Memory hotadd request/d' /etc/udev/rules.d/40-vm-hotadd.rules
sudo sed -i '/SUBSYSTEM=="memory", ACTION=="add"/d' /etc/udev/rules.d/40-vm-hotadd.rules
sudo rm /home/ubuntu/cuda-keyring_1.0-1_all.deb




# echo "$(date) - Installing Blender" >> $LOGFILE
# sudo snap install blender --classic

# echo "$(date) - Getting Cuda Samples" >> $LOGFILE
# cd /home/ubuntu
# git clone https://github.com/NVIDIA/cuda-samples.git

# echo "$(date) - Making deviceQuery" >> $LOGFILE
# cd /home/ubuntu/cuda-samples/Samples/1_Utilities/deviceQuery && make

# echo "$(date) - Making bandwidthTest" >> $LOGFILE
# cd /home/ubuntu/cuda-samples/Samples/1_Utilities/bandwidthTest && make

# echo "$(date) - Getting Profiler" >> $LOGFILE
# git clone git@github.com:alanwsmith/ec2-blender-renderer.alanwsmith.com.git

# echo "$(date) - Getting CUDA Stats" >> $LOGFILE
# /home/ubuntu/cuda-samples/Samples/1_Utilities/deviceQuery/deviceQuery > "/home/ubuntu/ec2-blender-renderer.alanwsmith.com/scripts/profile_machine/stats/$(curl -q http://169.254.169.254/latest/meta-data/instance-type).txt"

# echo "$(date) - Running Profiler" >> $LOGFILE
# cd /home/ubuntu/ec2-blender-renderer.alanwsmith.com/scripts/profile_machine && /usr/bin/python3 /home/ubuntu/ec2-blender-renderer.alanwsmith.com/scripts/profile_machine/profile_machine.py