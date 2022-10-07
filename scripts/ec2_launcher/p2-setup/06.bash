#!/bin/bash

LOGFILE="/home/ubuntu/setup/log.txt"

echo "$(date) - Profiling Machine" >> $LOGFILE
cd /home/ubuntu/ec2-blender-renderer.alanwsmith.com/scripts/profile_machine && /usr/bin/python3 profile_machine.py 