#!/bin/bash

LOGFILE="/home/ubuntu/setup/log.txt"

echo "$(date) - sudo apt -y update" >> $LOGFILE
sudo apt -y update

echo "$(date) - Installing AWS CLI" >> $LOGFILE
sudo snap install aws-cli --classic

echo "$(date) - Making test files directory" >> $LOGFILE
mkdir -p /home/ubuntu/blender_profiler/test_files

echo "$(date) - Getting test files from S3" >> $LOGFILE
/snap/bin/aws s3 cp "s3://aws-tmp-blender-test-files/flat-archiviz.blend" "/home/ubuntu/blender_profiler/test_files/flat-archiviz.blend"
/snap/bin/aws s3 cp "s3://aws-tmp-blender-test-files/loft.blend" "/home/ubuntu/blender_profiler/test_files/loft.blend"
/snap/bin/aws s3 cp "s3://aws-tmp-blender-test-files/lone-monk_cycles_and_exposure-node_demo.blend" "/home/ubuntu/blender_profiler/test_files/lone-monk_cycles_and_exposure-node_demo.blend"
/snap/bin/aws s3 cp "s3://aws-tmp-blender-test-files/monster_under_the_bed_sss_demo_by_metin_seven.blend" "/home/ubuntu/blender_profiler/test_files/monster_under_the_bed_sss_demo_by_metin_seven.blend"

echo "$(date) - Installing Blender dependicies" >> $LOGFILE
sudo apt -y install libxi6
sudo apt -y install libxxf86vm-dev
sudo apt -y install libxfixes-dev
sudo apt -y install libxrender-dev
sudo apt -y install libgl-dev

echo "$(date) - Installing Git Key" >> $LOGFILE
/snap/bin/aws --region us-east-1 secretsmanager get-secret-value --secret-id EC2_Key_For_GitHub --query SecretString --output text > ~/.ssh/id_ed25519
chmod 400 ~/.ssh/id_ed25519
eval "$(ssh-agent -s)" && ssh-add ~/.ssh/id_ed25519
echo "github.com,140.82.114.3 ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBEmKSENjQEezOmxkZMy7opKgwFB9nkt5YRrYMjNuG5N87uRgg6CLrbo5wAdT/y6v0mKV0U2w0WZ2YB/++Tpockg=" > ~/.ssh/known_hosts

