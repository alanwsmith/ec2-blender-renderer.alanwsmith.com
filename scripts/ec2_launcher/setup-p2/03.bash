#!/bin/bash

LOGFILE="/home/ubuntu/setup-log.txt"


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




sudo dpkg -i \
cuda-11-4_11.4.4-1_amd64.deb \
cuda-cccl-11-4_11.4.122-1_amd64.deb \
cuda-command-line-tools-11-4_11.4.4-1_amd64.deb \
cuda-compiler-11-4_11.4.4-1_amd64.deb \
cuda-cudart-11-4_11.4.148-1_amd64.deb \
cuda-cudart-dev-11-4_11.4.148-1_amd64.deb \
cuda-cuobjdump-11-4_11.4.120-1_amd64.deb \
cuda-cuxxfilt-11-4_11.4.120-1_amd64.deb \
cuda-demo-suite-11-4_11.4.100-1_amd64.deb \
cuda-documentation-11-4_11.4.126-1_amd64.deb \
cuda-driver-dev-11-4_11.4.148-1_amd64.deb \
cuda-libraries-11-4_11.4.4-1_amd64.deb \
cuda-libraries-dev-11-4_11.4.4-1_amd64.deb \
cuda-nvcc-11-4_11.4.152-1_amd64.deb \
cuda-nvml-dev-11-4_11.4.120-1_amd64.deb \
cuda-nvprune-11-4_11.4.120-1_amd64.deb \
cuda-nvrtc-11-4_11.4.152-1_amd64.deb \
cuda-nvrtc-dev-11-4_11.4.152-1_amd64.deb \
cuda-runtime-11-4_11.4.4-1_amd64.deb \
cuda-samples-11-4_11.4.120-1_amd64.deb \
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


##### Begin Scratchpad



cuda-cuobjdump-11-4
cuda-cuxxfilt-11-4
cuda-nvcc-11-4
cuda-nvprune-11-4
cuda-cudart-dev-11-4
cuda-cccl-11-4
cuda-driver-dev-11-4
cuda-nvrtc-dev-11-4
libcublas-dev-11-4
libcufft-dev-11-4
libcufile-dev-11-4
libcurand-dev-11-4
libcusolver-dev-11-4
libcusparse-dev-11-4
libnpp-dev-11-4
libnvjpeg-dev-11-4
cuda-command-line-tools-11-4
cuda-visual-tools-11-4
gds-tools-11-4
cuda-nvcc-11-4
cuda-libraries-dev-11-4
cuda-compiler-11-4
cuda-libraries-dev-11-4
cuda-tools-11-4
cuda-samples-11-4



### To make wget and insatll

cuda-cccl-11-4_11.4.122-1_amd64.deb
cuda-command-line-tools-11-4_11.4.4-1_amd64.deb
cuda-cudart-dev-11-4_11.4.148-1_amd64.deb
cuda-cuobjdump-11-4_11.4.120-1_amd64.deb
cuda-cuxxfilt-11-4_11.4.120-1_amd64.deb
cuda-driver-dev-11-4_11.4.148-1_amd64.deb
cuda-nvcc-11-4_11.4.152-1_amd64.deb
cuda-nvprune-11-4_11.4.120-1_amd64.deb
cuda-nvrtc-dev-11-4_11.4.152-1_amd64.deb
cuda-visual-tools-11-4_11.4.4-1_amd64.deb
gds-tools-11-4_1.0.2.10-1_amd64.deb
libcublas-dev-11-4_11.6.5.2-1_amd64.deb
libcufft-dev-11-4_10.5.2.100-1_amd64.deb
libcufile-dev-11-4_1.0.2.10-1_amd64.deb
libcurand-dev-11-4_10.2.5.120-1_amd64.deb
libcusolver-dev-11-4_11.2.0.120-1_amd64.deb
libcusparse-dev-11-4_11.6.0.120-1_amd64.deb
libnpp-dev-11-4_11.4.0.110-1_amd64.deb
libnvjpeg-dev-11-4_11.5.2.120-1_amd64.deb

###





