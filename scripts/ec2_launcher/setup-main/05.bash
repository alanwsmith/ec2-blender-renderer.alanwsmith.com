#!/bin/bash

LOGFILE="/home/ubuntu/setup/log.txt"

echo "$(date) - Making /run/user/1000/gvfs" >> $LOGFILE
mkdir -p /run/user/1000/gvfs
chmod ug+w /run/user/1000/gvfs

echo "$(date) - START: Machine Profiler" >> $LOGFILE
cd /home/ubuntu/ec2-blender-renderer.alanwsmith.com/scripts/profile_machine && /usr/bin/python3 profile_machine.py
echo "$(date) - END: Machine Profiler" >> $LOGFILE
