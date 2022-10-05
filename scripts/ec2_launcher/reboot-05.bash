#!/bin/bash

LOGFILE="/home/ubuntu/setup-log.txt"

echo "Starting script 05" >> $LOGFILE
echo "Starting Run" >> $LOGFILE
cd ~/ec2-blender-renderer.alanwsmith.com/scripts/profile_machine
python3 profile_machine.py
echo "TODO: 05- put in profile run here" >> $LOGFILE
echo "Finished script 05" >> $LOGFILE


