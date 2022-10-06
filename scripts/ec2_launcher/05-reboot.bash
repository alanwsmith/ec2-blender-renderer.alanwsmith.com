#!/bin/bash

LOGFILE="/home/ubuntu/setup-log.txt"
echo "sudo snap install blender --classic" >> $LOGFILE
sudo snap install blender --classic

cd /home/ubuntu
git clone https://github.com/NVIDIA/cuda-samples.git
cd /home/ubuntu/cuda-samples/Samples/1_Utilities/deviceQuery
make

cd /home/ubuntu/cuda-samples/Samples/1_Utilities/bandwidthTest
make
