#!/bin/bash

LOGFILE="/home/ubuntu/setup-log.txt"
echo "sudo snap install blender --classic" >> $LOGFILE
sudo snap install blender --classic

cd
git clone https://github.com/NVIDIA/cuda-samples.git
cd cuda-samples/Samples/1_Utilities/deviceQuery
make

cd 
cd cuda-samples/Samples/1_Utilities/bandwidthTest
make

