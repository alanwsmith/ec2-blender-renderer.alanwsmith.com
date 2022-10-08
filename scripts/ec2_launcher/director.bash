#!/bin/bash

LOG_FILE="/home/ubuntu/setup/log.txt"
TARGET_DIR="/home/ubuntu/setup/steps"
ACTIVE_FILE=`ls $TARGET_DIR | sort | head -1`

echo "$(date) - Initializing Setup Director" >> $LOG_FILE

if [ -z $ACTIVE_FILE ]
then
    echo "$(date) - No more files to process" >> $LOG_FILE
    echo "$(date) - Removing director removed from crontab" >> $LOG_FILE
    crontab -l > /home/ubuntu/crondata
    sed -i '/REBOOTSETUP/d' /home/ubuntu/crondata
    crontab /home/ubuntu/crondata
    rm /home/ubuntu/crondata
    echo "$(date) - Removing $TARGET_DIR" >> $LOG_FILE
    rmdir $TARGET_DIR
    echo "$(date) - Removing setup-director.bash" >> $LOG_FILE
    rm '/home/ubuntu/setup/director.bash'
    echo "$(date) - SETUP PROCESS COMPLETE" >> $LOG_FILE
    echo "$(date) - Shutting down" >> $LOG_FILE
    sudo shutdown
else
  ACTIVE_FILE_PATH="$TARGET_DIR/$ACTIVE_FILE"
  echo "$(date) - Running: ${ACTIVE_FILE_PATH}" >> $LOG_FILE
  /bin/bash -l $ACTIVE_FILE_PATH
  echo "$(date) - Deleting: ${ACTIVE_FILE_PATH}" >> $LOG_FILE
  rm $ACTIVE_FILE_PATH
  echo "$(date) - Rebooting from setup-director" >> $LOG_FILE
  sudo reboot 
fi           
