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
https://raw.githubusercontent.com/netwerkfix/random-scripts/main/password.sh

# give it perms
chmod 755 /etc/sysprep/preping.sh
chmod 755 /etc/sysprep/password.sh

# then we need make service
# chance the dir for the service
cd /etc/systemd/system/

# get files again
wget https://raw.githubusercontent.com/netwerkfix/ubuntu22.04-Sysprep/main/sysprep.service
sleep 1
https://github.com/netwerkfix/random-scripts/blob/main/passwd.service

# now we give it perms
chmod 755 /etc/systemd/system/sysprep.service
chmod 755 /etc/systemd/system/passwd.service

# now we enable the service
systemctl enable --now passwd.service
sleep 20
systemctl enable --now sysprep.service
