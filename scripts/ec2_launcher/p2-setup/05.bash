#!/bin/bash

LOGFILE="/home/ubuntu/setup/log.txt"

echo "$(date) - Installing Blender" >> $LOGFILE
sudo snap install blender --classic

echo "$(date) - Getting Cuda Samples" >> $LOGFILE
cd /home/ubuntu
git clone https://github.com/NVIDIA/cuda-samples.git

echo "$(date) - Making deviceQuery" >> $LOGFILE
cd /home/ubuntu/cuda-samples/Samples/1_Utilities/deviceQuery && make

echo "$(date) - Making bandwidthTest" >> $LOGFILE
cd /home/ubuntu/cuda-samples/Samples/1_Utilities/bandwidthTest && make

echo "$(date) - Getting Profiler" >> $LOGFILE
cd /home/ubuntu && git clone git@github.com:alanwsmith/ec2-blender-renderer.alanwsmith.com.git

echo "$(date) - Getting CUDA Stats" >> $LOGFILE
/home/ubuntu/cuda-samples/Samples/1_Utilities/deviceQuery/deviceQuery > "/home/ubuntu/ec2-blender-renderer.alanwsmith.com/scripts/profile_machine/stats/$(curl -q http://169.254.169.254/latest/meta-data/instance-type).txt"


