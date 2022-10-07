
# NOTE: It looks like `sudo apt -y install cuda`
# removed all this stuff - but then things didn't 
# work. Leavin here for now
echo "$(date) - Installing NVIDIA Drivers" >> $LOGFILE
sudo apt -y install \
nvidia-driver-470 \
libnvidia-gl-470 \
nvidia-dkms-470 \
nvidia-kernel-source-470 \
nvidia-kernel-common-470 \
nvidia-compute-utils-470 \
xserver-xorg-video-nvidia-470 \
libnvidia-cfg1-470 \
libnvidia-ifr1-470 


wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-11-4_11.4.4-1_amd64.deb
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-cccl-11-4_11.4.122-1_amd64.deb
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-command-line-tools-11-4_11.4.4-1_amd64.deb
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-compiler-11-4_11.4.4-1_amd64.deb
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-cudart-11-4_11.4.148-1_amd64.deb
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-cudart-dev-11-4_11.4.148-1_amd64.deb
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-cuobjdump-11-4_11.4.120-1_amd64.deb
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-cuxxfilt-11-4_11.4.120-1_amd64.deb
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-demo-suite-11-4_11.4.100-1_amd64.deb
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-documentation-11-4_11.4.126-1_amd64.deb
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-driver-dev-11-4_11.4.148-1_amd64.deb
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-libraries-11-4_11.4.4-1_amd64.deb
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-libraries-dev-11-4_11.4.4-1_amd64.deb
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-nvcc-11-4_11.4.152-1_amd64.deb
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-nvml-dev-11-4_11.4.120-1_amd64.deb
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-nvprune-11-4_11.4.120-1_amd64.deb
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-nvrtc-11-4_11.4.152-1_amd64.deb
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-nvrtc-dev-11-4_11.4.152-1_amd64.deb
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-runtime-11-4_11.4.4-1_amd64.deb
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-samples-11-4_11.4.120-1_amd64.deb
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-toolkit-11-4-config-common_11.4.148-1_all.deb
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-toolkit-11-4_11.4.4-1_amd64.deb
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-tools-11-4_11.4.4-1_amd64.deb
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-visual-tools-11-4_11.4.4-1_amd64.deb
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/gds-tools-11-4_1.0.2.10-1_amd64.deb
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/libcublas-11-4_11.6.5.2-1_amd64.deb
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/libcublas-dev-11-4_11.6.5.2-1_amd64.deb
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/libcufft-11-4_10.5.2.100-1_amd64.deb
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/libcufft-dev-11-4_10.5.2.100-1_amd64.deb
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/libcufile-11-4_1.0.2.10-1_amd64.deb
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/libcufile-dev-11-4_1.0.2.10-1_amd64.deb
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/libcurand-11-4_10.2.5.120-1_amd64.deb
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/libcurand-dev-11-4_10.2.5.120-1_amd64.deb
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/libcusolver-11-4_11.2.0.120-1_amd64.deb
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/libcusolver-dev-11-4_11.2.0.120-1_amd64.deb
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/libcusparse-11-4_11.6.0.120-1_amd64.deb
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/libcusparse-dev-11-4_11.6.0.120-1_amd64.deb
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/libnpp-11-4_11.4.0.110-1_amd64.deb
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/libnpp-dev-11-4_11.4.0.110-1_amd64.deb
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/libnvjpeg-11-4_11.5.2.120-1_amd64.deb
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/libnvjpeg-dev-11-4_11.5.2.120-1_amd64.deb


wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-cupti-dev-11-4_11.4.120-1_amd64.deb
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-cupti-dev-11-4_11.4.120-1_amd64.deb
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-gdb-11-4_11.4.120-1_amd64.deb
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-memcheck-11-4_11.4.120-1_amd64.deb

wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-nsight-compute-11-4_11.4.4-1_amd64.deb
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-nvvp-11-4_11.4.193-1_amd64.deb

sudo dpkg -i \
cuda-11-4_11.4.4-1_amd64.deb \
cuda-cccl-11-4_11.4.122-1_amd64.deb \
cuda-command-line-tools-11-4_11.4.4-1_amd64.deb \
cuda-compiler-11-4_11.4.4-1_amd64.deb \
cuda-cudart-11-4_11.4.148-1_amd64.deb \
cuda-cudart-dev-11-4_11.4.148-1_amd64.deb \
cuda-cuobjdump-11-4_11.4.120-1_amd64.deb \
cuda-cupti-dev-11-4_11.4.120-1_amd64.deb \
cuda-cuxxfilt-11-4_11.4.120-1_amd64.deb \
cuda-demo-suite-11-4_11.4.100-1_amd64.deb \
cuda-documentation-11-4_11.4.126-1_amd64.deb \
cuda-driver-dev-11-4_11.4.148-1_amd64.deb \
cuda-gdb-11-4_11.4.120-1_amd64.deb \
cuda-libraries-11-4_11.4.4-1_amd64.deb \
cuda-libraries-dev-11-4_11.4.4-1_amd64.deb \
cuda-memcheck-11-4_11.4.120-1_amd64.deb \
cuda-nsight-compute-11-4_11.4.4-1_amd64.deb \
cuda-nvcc-11-4_11.4.152-1_amd64.deb \
cuda-nvdisasm-11-4_11.4.152-1_amd64.deb \
cuda-nvml-dev-11-4_11.4.120-1_amd64.deb \
cuda-nvprof-11-4_11.4.120-1_amd64.deb \
cuda-nvprune-11-4_11.4.120-1_amd64.deb \
cuda-nvrtc-11-4_11.4.152-1_amd64.deb \
cuda-nvrtc-dev-11-4_11.4.152-1_amd64.deb \
cuda-nvtx-11-4_11.4.120-1_amd64.deb \
cuda-nvvp-11-4_11.4.193-1_amd64.deb \
cuda-runtime-11-4_11.4.4-1_amd64.deb \
cuda-samples-11-4_11.4.120-1_amd64.deb \
cuda-sanitizer-11-4_11.4.120-1_amd64.deb \
cuda-toolkit-11-4-config-common_11.4.148-1_all.deb \
cuda-toolkit-11-4_11.4.4-1_amd64.deb \
cuda-tools-11-4_11.4.4-1_amd64.deb \
cuda-visual-tools-11-4_11.4.4-1_amd64.deb \
gds-tools-11-4_1.0.2.10-1_amd64.deb \
libcublas-11-4_11.6.5.2-1_amd64.deb \
libcublas-dev-11-4_11.6.5.2-1_amd64.deb \
libcufft-11-4_10.5.2.100-1_amd64.deb \
libcufft-dev-11-4_10.5.2.100-1_amd64.deb \
libcufile-11-4_1.0.2.10-1_amd64.deb \
libcufile-dev-11-4_1.0.2.10-1_amd64.deb \
libcurand-11-4_10.2.5.120-1_amd64.deb \
libcurand-dev-11-4_10.2.5.120-1_amd64.deb \
libcusolver-11-4_11.2.0.120-1_amd64.deb \
libcusolver-dev-11-4_11.2.0.120-1_amd64.deb \
libcusparse-11-4_11.6.0.120-1_amd64.deb \
libcusparse-dev-11-4_11.6.0.120-1_amd64.deb \
libnpp-11-4_11.4.0.110-1_amd64.deb \
libnpp-dev-11-4_11.4.0.110-1_amd64.deb \
libnvjpeg-11-4_11.5.2.120-1_amd64.deb \
libnvjpeg-dev-11-4_11.5.2.120-1_amd64.deb


echo "$(date) - Installing Cuda Keyring" >> $LOGFILE
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-keyring_1.0-1_all.deb
sudo dpkg -i cuda-keyring_1.0-1_all.deb
sudo apt-key del 7fa2af80
sudo apt-get update
echo "$(date) - Installing Cuda" >> $LOGFILE
sudo apt -y install cuda

echo "$(date) - Doing Post Install Steps" >> $LOGFILE
echo 'export PATH=/usr/local/cuda-11.8/bin${PATH:+:${PATH}}' >> /home/ubuntu/.bashrc
sudo cp /lib/udev/rules.d/40-vm-hotadd.rules /etc/udev/rules.d
sudo sed -i '/# Memory hotadd request/d' /etc/udev/rules.d/40-vm-hotadd.rules
sudo sed -i '/SUBSYSTEM=="memory", ACTION=="add"/d' /etc/udev/rules.d/40-vm-hotadd.rules
sudo rm /home/ubuntu/cuda-keyring_1.0-1_all.deb




# echo "$(date) - Installing Blender" >> $LOGFILE
# sudo snap install blender --classic

# echo "$(date) - Getting Cuda Samples" >> $LOGFILE
# cd /home/ubuntu
# git clone https://github.com/NVIDIA/cuda-samples.git

# echo "$(date) - Making deviceQuery" >> $LOGFILE
# cd /home/ubuntu/cuda-samples/Samples/1_Utilities/deviceQuery && make

# echo "$(date) - Making bandwidthTest" >> $LOGFILE
# cd /home/ubuntu/cuda-samples/Samples/1_Utilities/bandwidthTest && make

# echo "$(date) - Getting Profiler" >> $LOGFILE
# git clone git@github.com:alanwsmith/ec2-blender-renderer.alanwsmith.com.git

# echo "$(date) - Getting CUDA Stats" >> $LOGFILE
# /home/ubuntu/cuda-samples/Samples/1_Utilities/deviceQuery/deviceQuery > "/home/ubuntu/ec2-blender-renderer.alanwsmith.com/scripts/profile_machine/stats/$(curl -q http://169.254.169.254/latest/meta-data/instance-type).txt"

# echo "$(date) - Running Profiler" >> $LOGFILE
# cd /home/ubuntu/ec2-blender-renderer.alanwsmith.com/scripts/profile_machine && /usr/bin/python3 /home/ubuntu/ec2-blender-renderer.alanwsmith.com/scripts/profile_machine/profile_machine.py






echo "$(date) - Doing Post Install Steps" >> $LOGFILE
echo 'export PATH=/usr/local/cuda-11.8/bin${PATH:+:${PATH}}' >> /home/ubuntu/.bashrc
sudo cp /lib/udev/rules.d/40-vm-hotadd.rules /etc/udev/rules.d
sudo sed -i '/# Memory hotadd request/d' /etc/udev/rules.d/40-vm-hotadd.rules
sudo sed -i '/SUBSYSTEM=="memory", ACTION=="add"/d' /etc/udev/rules.d/40-vm-hotadd.rules
sudo rm /home/ubuntu/setup/cuda-keyring_1.0-1_all.deb



