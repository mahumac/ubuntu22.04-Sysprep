#!/bin/bash
######################################################
#### WARNING PIPING TO BASH IS STUPID: DO NOT USE THIS
######################################################
# TESTED ON UBUNTU 22.04.1 LTS (Works for me)

# this command give the script sudo perms

if [ `id -u` -ne 0 ]; then
	echo Need sudo
	exit 1
fi

set -v

# making working dir
mkdir -p /etc/sysprep/

# chance dir
cd /etc/sysprep/

# get files
wget https://raw.githubusercontent.com/netwerkfix/ubuntu22.04-Sysprep/main/preping.sh
sleep 1
wget https://raw.githubusercontent.com/netwerkfix/random-scripts/main/update-now.sh

# give it perms
chmod 755 /etc/sysprep/preping.sh
chmod 755 /etc/sysprep/update-now.sh

# then we need make service
# chance the dir for the service
cd /etc/systemd/system/

# get files again
wget https://raw.githubusercontent.com/netwerkfix/ubuntu22.04-Sysprep/main/sysprep.service
wget https://raw.githubusercontent.com/netwerkfix/random-scripts/main/updates.service
# now we give it perms
chmod 755 /etc/systemd/system/sysprep.service
sleep 1
chmod 755 /etc/systemd/system/updates.service

# now we enable the service
systemctl enable sysprep.service
systemctl enable updates.service

# reboot after 10sec
sleep 10 ; reboot
