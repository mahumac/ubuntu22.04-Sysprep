
#!/bin/bash
######################################################
#### WARNING PIPING TO BASH IS STUPID: DO NOT USE THIS
######################################################
# modified from: jcppkkk/prepare-ubuntu-template.sh
# TESTED ON UBUNTU 18.04 LTS (Alternate installer, without cloud-init)
# TESTED ON UBUNTU 22.04.1 LTS (Works for me)

if [ `id -u` -ne 0 ]; then
	echo Need sudo
	exit 1
fi

set -v

mkdir -p /etc/sysprep/
sleep 2
cd /etc/sysprep/
sleep 2
wget https://raw.githubusercontent.com/netwerkfix/ubuntu22.04-Sysprep/main/preping.sh
sleep 3
cd /etc/systemd/system/
sleep 2
wget https://raw.githubusercontent.com/netwerkfix/ubuntu22.04-Sysprep/main/sysprep.service
sleep 2
chmod 755 /etc/systemd/system/sysprep.service
sleep 2
chmod 755 /etc/sysprep/preping.sh
sleep 2
cd /etc/sysprep/
sleep 2
wget https://raw.githubusercontent.com/netwerkfix/random-scripts/main/install-last.sh
sleep 2
chmod 755 install-last.sh
sleep 3
./install-last.sh
sleep 3
systemctl enable --now sysprep.service
