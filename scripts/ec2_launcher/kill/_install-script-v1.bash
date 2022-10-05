#!/bin/bash

LOGFILE=/home/ec2-user/log.txt

# su ec2-user -c 'touch ~/test-file-4.txt'
echo "Starting process" >> $LOGFILE
chown -R ec2-user /home/ec2-user/log.txt
echo "Installing dependicies" >> $LOGFILE
sudo yum -y install libX11
sudo yum -y install libXi
sudo yum -y install libXxf86vm
sudo yum -y install libXfixes
sudo yum -y install libXrender
sudo yum -y install libGL
sudo yum -y install jq
sudo yum -y install git
echo "Getting GitHub SSH Key" >> $LOGFILE
su ec2-user -c 'aws --region us-east-1 secretsmanager get-secret-value --secret-id EC2_Key_For_GitHub --query SecretString --output text > ~/.ssh/id_ed25519'
su ec2-user -c 'chmod 400 ~/.ssh/id_ed25519'
su ec2-user -c 'eval "$(ssh-agent -s)" && ssh-add ~/.ssh/id_ed25519'
su ec2-user -c 'echo "github.com,140.82.114.3 ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBEmKSENjQEezOmxkZMy7opKgwFB9nkt5YRrYMjNuG5N87uRgg6CLrbo5wAdT/y6v0mKV0U2w0WZ2YB/++Tpockg=" > ~/.ssh/known_hosts'
echo "Making gvfs dir" >> $LOGFILE
mkdir /run/user/1000/gvfs
echo "Making blender directory" >> $LOGFILE
su ec2-user -c 'mkdir /home/ec2-user/blender'
cd /home/ec2-user/blender
echo "Downloading blender" >> $LOGFILE
su ec2-user -c 'wget -q https://mirror.clarkson.edu/blender/release/Blender3.3/blender-3.3.0-linux-x64.tar.xz'
echo "Extracting blender" >> $LOGFILE
su ec2-user -c 'tar -xf blender-3.3.0-linux-x64.tar.xz'
echo "Pulling github project" >> $LOGFILE
su ec2-user -c 'git clone git@github.com:alanwsmith/ec2-blender-renderer.alanwsmith.com.git'
echo "Install requests" >> $LOGFILE
su ec2-user -c 'pip3 install requests'
echo "Running profiler" >> $LOGFILE
su ec2-user -c 'cd ~/blender/ec2-blender-renderer.alanwsmith.com/scripts/profile_machine/ && python3 profile_machine.py'
echo "Shutting down" >> $LOGFILE
# shutdown


