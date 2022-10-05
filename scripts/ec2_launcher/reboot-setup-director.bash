#!/bin/bash

LOG_FILE="/home/ubuntu/reboot-log.txt"
TARGET_DIR="/home/ubuntu/reboot-setup"
ACTIVE_FILE=`ls $TARGET_DIR | sort | head -1`

echo "Starting up" >> $LOG_FILE

if [ -z $ACTIVE_FILE ]
then
    echo "No more files to process" >> $LOG_FILE
    crontab -l > /home/ubuntu/crondata
    sed -i '\/@reboot touch \/home\/ubuntu\/reboot-setup-director.bash/d' /home/ubuntu/crondata
    crontab /home/ubuntu/crondata
    rm /home/ubuntu/crondata
    echo "Reboot director removed from crontab" >> $LOG_FILE
    echo "TODO: Remove the reboot-setup directory and directory" >> $LOG_FILE
else
  ACTIVE_FILE_PATH="$TARGET_DIR/$ACTIVE_FILE"
  echo "Running: ${ACTIVE_FILE_PATH}" >> $LOG_FILE
  /bin/bash $ACTIVE_FILE_PATH
  echo "Removing: ${ACTIVE_FILE_PATH}" >> $LOG_FILE
  rm $ACTIVE_FILE_PATH
  echo "Rebooting" >> $LOG_FILE
fi           

