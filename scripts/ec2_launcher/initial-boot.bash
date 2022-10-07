#!/bin/bash

su ubuntu -c "mkdir -p /home/ubuntu/setup/steps"
su ubuntu -c 'echo "$(date) - Initial boot" >> /home/ubuntu/setup/log.txt'

su ubuntu -c 'crontab -l > /home/ubuntu/setup/crondata'
echo "@reboot /bin/bash /home/ubuntu/setup/director.bash # REBOOTSETUP" >> /home/ubuntu/setup/crondata
su ubuntu -c 'crontab /home/ubuntu/setup/crondata'
rm /home/ubuntu/setup/crondata
