#!/bin/bash

# this one runs as root and sets things
# to run as the ubuntu user
su ubuntu -c 'crontab -l > /home/ubuntu/crondata'
echo "@reboot /home/ubuntu/reboot1.bash" >> /home/ubuntu/crondata
echo "@reboot touch /home/ubuntu/test-file-from-cron-reboot.txt" >> /home/ubuntu/crondata






