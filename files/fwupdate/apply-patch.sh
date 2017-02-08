#!/bin/bash

cd /home/debian/ism-device-scripts
echo "------- Updating ISM DEVICE SCRIPTS -------"
git pull -qf
cd cryptocape-init
echo "---------- Updating CRYPTO INIT -----------"
git pull -qf
cd /home/debian/ism-device-server
echo "------- Updating ISM DEVICE SERVER --------"
git pull -qf

echo "------------ Copying binaries -------------"
cp -f /home/debian/.fwtmp/deh /home/debian/ism-device-crypto/
cp -f /home/debian/.fwtmp/libdevicecrypto.so /home/debian/ism-device-crypto/
cp -f /home/debian/.fwtmp/statetest /home/debian/ism-device/ismdevice-armhf/statetest
echo "Done!"
