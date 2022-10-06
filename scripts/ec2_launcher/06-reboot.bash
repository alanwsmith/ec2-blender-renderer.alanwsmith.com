#!/bin/bash

LOGFILE="/home/ubuntu/setup-log.txt"

echo "$(date) - Getting CUDA Stats" >> $LOGFILE
/home/ubuntu/cuda-samples/Samples/1_Utilities/deviceQuery/deviceQuery > "/home/ubuntu/ec2-blender-renderer.alanwsmith.com/scripts/profile_machine/stats/$(curl -q http://169.254.169.254/latest/meta-data/instance-type).txt"

echo "$(date) - Getting Profiler" >> $LOGFILE
git clone git@github.com:alanwsmith/ec2-blender-renderer.alanwsmith.com.git


echo "$(date) - Running Profiler" >> $LOGFILE
cd /home/ubuntu/ec2-blender-renderer.alanwsmith.com/scripts/profile_machine
/usr/bin/python3 profile_machine.py
