#!/bin/bash

su ubuntu -c 'echo "Prepping scripts" >> /home/ubuntu/setup-log.txt'

TARGET_DIR="/home/ubuntu/reboot-setup"

su ubuntu -c "mkdir $TARGET_DIR"

su ubuntu -c 'crontab -l > /home/ubuntu/crondata'
echo "@reboot /bin/bash /home/ubuntu/reboot-setup-director.bash # REBOOTSETUP" >> /home/ubuntu/crondata
su ubuntu -c 'crontab /home/ubuntu/crondata'
rm /home/ubuntu/crondata
