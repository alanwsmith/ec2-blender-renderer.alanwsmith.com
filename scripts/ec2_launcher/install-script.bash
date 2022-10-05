#!/bin/bash

LOGFILE=/home/ubuntu/log.txt



# su ubuntu -c 'touch ~/test-file-4.txt'
# echo "Starting process" >> $LOGFILE
# chown -R ubuntu /home/ubuntu/log.txt
# echo "Installing dependicies" >> $LOGFILE
# sudo yum -y install libX11
# sudo yum -y install libXi
# sudo yum -y install libXxf86vm
# sudo yum -y install libXfixes
# sudo yum -y install libXrender
# sudo yum -y install libGL
# sudo yum -y install jq
# sudo yum -y install git
# echo "Getting GitHub SSH Key" >> $LOGFILE
# su ubuntu -c 'aws --region us-east-1 secretsmanager get-secret-value --secret-id EC2_Key_For_GitHub --query SecretString --output text > ~/.ssh/id_ed25519'
# su ubuntu -c 'chmod 400 ~/.ssh/id_ed25519'
# su ubuntu -c 'eval "$(ssh-agent -s)" && ssh-add ~/.ssh/id_ed25519'
# su ubuntu -c 'echo "github.com,140.82.114.3 ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBEmKSENjQEezOmxkZMy7opKgwFB9nkt5YRrYMjNuG5N87uRgg6CLrbo5wAdT/y6v0mKV0U2w0WZ2YB/++Tpockg=" > ~/.ssh/known_hosts'
# echo "Making gvfs dir" >> $LOGFILE
# mkdir /run/user/1000/gvfs
# echo "Making blender directory" >> $LOGFILE
# su ubuntu -c 'mkdir /home/ubuntu/blender'
# cd /home/ubuntu/blender
# echo "Downloading blender" >> $LOGFILE
# su ubuntu -c 'wget -q https://mirror.clarkson.edu/blender/release/Blender3.3/blender-3.3.0-linux-x64.tar.xz'
# echo "Extracting blender" >> $LOGFILE
# su ubuntu -c 'tar -xf blender-3.3.0-linux-x64.tar.xz'
# echo "Pulling github project" >> $LOGFILE
# su ubuntu -c 'git clone git@github.com:alanwsmith/ec2-blender-renderer.alanwsmith.com.git'
# echo "Install requests" >> $LOGFILE
# su ubuntu -c 'pip3 install requests'
# echo "Running profiler" >> $LOGFILE
# su ubuntu -c 'cd ~/blender/ec2-blender-renderer.alanwsmith.com/scripts/profile_machine/ && python3 profile_machine.py'
# echo "Shutting down" >> $LOGFILE
# # shutdown


