#!/bin/bash

LOGFILE="/home/ubuntu/setup-log.txt"
echo "sudo apt -y update" >> $LOGFILE
sudo apt -y update
echo "Making test files directory" >> $LOGFILE
mkdir -p /home/ubuntu/blender_profiler/test_files
echo "Installing AWS CLI" >> $LOGFILE
sudo snap install aws-cli --classic
echo "Getting files from S3" >> $LOGFILE
aws s3 cp s3://aws-tmp-blender-test-files/flat-archiviz.blend /home/ubuntu/blender_profiler/test_files
aws s3 cp s3://aws-tmp-blender-test-files/loft.blend /home/ubuntu/blender_profiler/test_files
aws s3 cp s3://aws-tmp-blender-test-files/lone-monk_cycles_and_exposure-node_demo.blend /home/ubuntu/blender_profiler/test_files
aws s3 cp s3://aws-tmp-blender-test-files/monster_under_the_bed_sss_demo_by_metin_seven.blend /home/ubuntu/blender_profiler/test_files
echo "Installing Blender dependicies" >> $LOGFILE
sudo apt -y install libxi6
sudo apt -y install libxxf86vm-dev
sudo apt -y install libxfixes-dev
sudo apt -y install libxrender-dev
sudo apt -y install libgl-dev
