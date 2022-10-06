#!/bin/bash

LOGFILE="/home/ubuntu/setup-log.txt"
echo "$(date) - Getting Profiler" >> $LOGFILE
git clone git@github.com:alanwsmith/ec2-blender-renderer.alanwsmith.com.git
echo "$(date) - Running Profiler" >> $LOGFILE
cd /home/ubuntu/ec2-blender-renderer.alanwsmith.com/scripts/profile_machine
python3 profile_machine.py
