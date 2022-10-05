#!/bin/bash

LOGFILE="/home/ubuntu/setup-log.txt"

echo "Starting script 04" >> $LOGFILE
sudo apt-update 
sudo snap install aws-cli --classic
aws --region us-east-1 secretsmanager get-secret-value --secret-id EC2_Key_For_GitHub --query SecretString --output text > ~/.ssh/id_ed25519
chmod 400 ~/.ssh/id_ed25519
eval "$(ssh-agent -s)" && ssh-add ~/.ssh/id_ed25519
echo "github.com,140.82.114.3 ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBEmKSENjQEezOmxkZMy7opKgwFB9nkt5YRrYMjNuG5N87uRgg6CLrbo5wAdT/y6v0mKV0U2w0WZ2YB/++Tpockg=" >> ~/.ssh/known_hosts
mkdir -p /run/user/1000/gvfs
sudo snap install blender --classic
git clone git@github.com:alanwsmith/ec2-blender-renderer.alanwsmith.com.git
sudo apt -y install python3-pip
pip3 install requests
echo "Finished script 04" >> $LOGFILE


