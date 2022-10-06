#!/bin/bash

LOGFILE="/home/ubuntu/setup-log.txt"

echo "Starting script 05" >> $LOGFILE
echo "Downloading from S3 if available" >> $LOGFILE
mkdir -p /home/ubuntu/blender_profiler/test_files
aws s3 cp s3://aws-tmp-blender-test-files/flat-archiviz.blend /home/ubuntu/blender_profiler/test_files/
aws s3 cp s3://aws-tmp-blender-test-files/loft.blend /home/ubuntu/blender_profiler/test_files/
aws s3 cp s3://aws-tmp-blender-test-files/lone-monk_cycles_and_exposure-node_demo.blend /home/ubuntu/blender_profiler/test_files/
aws s3 cp s3://aws-tmp-blender-test-files/monster_under_the_bed_sss_demo_by_metin_seven.blend /home/ubuntu/blender_profiler/test_files/
echo "Starting Profiler Run" >> $LOGFILE
cd ~/ec2-blender-renderer.alanwsmith.com/scripts/profile_machine
echo "TODO: 05- put in profile run here" >> $LOGFILE
# python3 profile_machine.py
echo "Finished script 05" >> $LOGFILE


