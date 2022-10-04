#!/bin/bash

su - ec2-user
cd ~/
echo "Starting process" >> ~/log.txt
echo "Installing dependicies" >> ~/log.txt
sudo yum -y install libX11
sudo yum -y install libXi
sudo yum -y install libXxf86vm
sudo yum -y install libXfixes
sudo yum -y install libXrender
sudo yum -y install libGL
sudo yum -y install jq
echo "Getting GitHub SSH Key" >> ~/log.txt
aws secretsmanager get-secret-value --secret-id EC2_Key_For_GitHub --query SecretString --output text > ~/.ssh/id_ed25519
echo "Making gvfs dir" >> ~/log.txt
mkdir /run/user/1000/gvfs
echo "Making blender directory" >> ~/log.txt
mkdir ~/blender
cd ~/blender
echo "Downloading blender" >> ~/log.txt
wget -q https://mirror.clarkson.edu/blender/release/Blender3.3/blender-3.3.0-linux-x64.tar.xz
echo "Extracting blender" >> ~/log.txt
tar -xf blender-3.3.0-linux-x64.tar.xz
echo "Pulling github project" >> ~/log.txt
git@github.com:alanwsmith/ec2-blender-renderer.alanwsmith.com.git
echo "TODO: Run profiler" >> ~/log.txt



