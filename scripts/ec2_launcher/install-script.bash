#!/bin/bash

LOGFILE=/home/ubuntu/log.txt
su ubuntu -c 'echo "Process started" >> $LOGFILE'

# su ubuntu -c 'echo "Updating crontab" >> $LOGFILE'
# su ubuntu -c 'crontab -l > crondata'
# su ubuntu -c 'echo "@reboot /home/ubuntu/reboot1.bash" >> crondata'
# su ubuntu -c 'echo "@reboot touch /home/ubuntu/test-file-from-cron-reboot.txt" >> crondata'
# su ubuntu -c 'crontab crondata'
# su ubuntu -c 'rm crondata'

# su ubuntu -c 'echo "Making reboot1 Script" >> $LOGFILE'
# su ubuntu -c 'echo "#!/bin/bash" >> reboot1.bash'
# su ubuntu -c 'echo "" >> reboot1.bash'
# su ubuntu -c 'echo "echo reboot1Started >> /home/ubuntu/log.txt" >> reboot1.bash'
# su ubuntu -c 'echo "sudo apt -y install nvidia-headless-515-server" >> reboot1.bash'

# su ubuntu -c 'echo "crontab -l > /home/ubuntu/crondata" >> reboot1.bash'
# su ubuntu -c "echo 'sed -i \"/@reboot touch \/home\/ubuntu\/reboot1.bash/d\" crondata' >> reboot1.bash"
# su ubuntu -c 'echo "echo \"@reboot /home/ubuntu/reboot2.bash\" >> crondata" >> reboot1.bash'
# su ubuntu -c 'echo "crontab crondata" >> reboot1.bash'
# su ubuntu -c 'echo "rm crondata" >> reboot1.bash'

#su ubuntu -c 'echo "echo reboot1Done >> /home/ubuntu/log.txt" >> reboot1.bash'


# sudo apt -y update
# sudo apt -y upgrade
# su ubuntu -c 'echo "Upgrate complete" >> $LOGFILE'
# su ubuntu -c 'echo "Making reboot2 Script" >> $LOGFILE'
# su ubuntu -c 'echo "#!/bin/bash" >> reboot2.bash'
# su ubuntu -c 'echo "" >> reboot2.bash'
# su ubuntu -c 'echo "echo reboot2Started >> /home/ubuntu/log.txt" >> /home/ubuntu/log.txt'
# su ubuntu -c 'echo "echo reboot2Started >> /home/ubuntu/log.txt" >> /home/ubuntu/log.txt'
# su ubuntu -c 'echo "#!/bin/bash" >> reboot2.bash'
# su ubuntu -c 'echo "Finished first setup" >> $LOGFILE'
# su ubuntu -c 'echo "Rebooting" >> $LOGFILE'
# reboot
