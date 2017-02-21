#!/bin/bash

# Give the process 5 seconds to exit
sleep 5
# If there still is a process statetest, kill with SIGKILL
while ps -fC statetest; do
  kill -9 `pidof statetest`
done;

cd /home/debian
# Remove all non-hidden files
echo "----------------- Removing old files ----------------"
rm -rf *
if [ $? -ne 0 ]; then
  echo "Error"
  sudo reboot now
  exit 1
fi
cd .fwtmp
if [ $? -ne 0 ]; then
  echo "Error"
  sudo reboot now
  exit 1
fi
echo "---------------- Extracting new files ---------------"
tar -xzf home.tgz -C /home/debian/
if [ $? -ne 0 ]; then
  echo "Error"
  sudo reboot now
  exit 1
fi
echo "---------- Running user defined settings -----------"
[ -f settings.sh ] && source settings.sh || echo "No settings file found"
if [ $? -ne 0 ]; then
  echo "Error"
  sudo reboot now
  exit 1
fi
echo "----------------------------------------------------"
echo "------ Firmware Update completed successfully ------"
sudo reboot now
