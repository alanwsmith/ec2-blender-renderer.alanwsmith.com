#!/bin/bash

LOG_FILE="/home/ubuntu/setup-log.txt"
TARGET_DIR="/home/ubuntu/reboot-setup"
ACTIVE_FILE=`ls $TARGET_DIR | sort | head -1`

echo "Starting up" >> $LOG_FILE

if [ -z $ACTIVE_FILE ]
then
    echo "No more files to process" >> $LOG_FILE
    echo "Removing director removed from crontab" >> $LOG_FILE
    crontab -l > /home/ubuntu/crondata
    sed -i '/REBOOTSETUP/d' /home/ubuntu/crondata
    crontab /home/ubuntu/crondata
    rm /home/ubuntu/crondata
    echo "Removing $TARGET_DIR" >> $LOG_FILE
    rmdir $TARGET_DIR
    echo "Removing reboot-setup-director.bash" >> $LOG_FILE
    rm '/home/ubuntu/reboot-setup-director.bash'
    shutdown
else
  ACTIVE_FILE_PATH="$TARGET_DIR/$ACTIVE_FILE"
  echo "Running: ${ACTIVE_FILE_PATH}" >> $LOG_FILE
  /bin/bash $ACTIVE_FILE_PATH
  echo "Removing: ${ACTIVE_FILE_PATH}" >> $LOG_FILE
  rm $ACTIVE_FILE_PATH
  echo "Rebooting from reboot-setup-director" >> $LOG_FILE
  sudo reboot 
fi           

