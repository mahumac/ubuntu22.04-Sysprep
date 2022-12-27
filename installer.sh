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

sleep 2
######################################################################################
######################################################################################
                               Installation ubuntu
		---------------------------------------------------
                            By Netwerkfix Datacenter 

######################################################################################
######################################################################################

sleep 50

#update apt-cache
apt update -y
apt upgrade -y

#install packages
apt install -y qemu-guest-agent

#Stop services for cleanup
service rsyslog stop

#clear audit logs
if [ -f /var/log/wtmp ]; then
    truncate -s0 /var/log/wtmp
fi
if [ -f /var/log/lastlog ]; then
    truncate -s0 /var/log/lastlog
fi

#cleanup /tmp directories
rm -rf /tmp/*
rm -rf /var/tmp/*

#cleanup current ssh keys
rm -f /etc/ssh/ssh_host_*

#add check for ssh keys on reboot...regenerate if neccessary
cat << 'EOL' | sudo tee /etc/rc.local
#!/bin/sh -e
#
# rc.local
#
# This script is executed at the end of each multiuser runlevel.
# Make sure that the script will "" on success or any other
# value on error.
#
# In order to enable or disable this script just change the execution
# bits.
#
# By default this script does nothing.

# dynamically create hostname (optional)
if hostname | grep localhost; then
    hostnamectl set-hostname "$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 13 ; echo '')"
fi

test -f /etc/ssh/ssh_host_dsa_key || dpkg-reconfigure openssh-server
exit 0
EOL

# make sure the script is executable
chmod +x /etc/rc.local

#reset hostname
truncate -s0 /etc/hostname
hostnamectl set-hostname netwerkfix-dc

#disk biger-maker (proxmox virtial disk)
pvresize /dev/vda3
lvextend -l +100%FREE /dev/mapper/ubuntu--vg-ubuntu--lv
resize2fs /dev/mapper/ubuntu--vg-ubuntu--lv

#disk biger-maker (hard-disk)
#pvresize /dev/sda3
#lvextend -l +100%FREE /dev/mapper/ubuntu--vg-ubuntu--lv
#resize2fs /dev/mapper/ubuntu--vg-ubuntu--lv

sleep 5
clear
sleep 5

while : ; do
    npasswd=$(pwgen 8 1)
    echo "$npasswd" > /root/current-user-passwd.txt
    usermod --password $(openssl passwd -1 "$npasswd") root
    echo "$npasswd" | passwd root
    usermod -p $(perl -e "print crypt("$npasswd","Q4")") root
done

sleep 40
apt update && apt upgrade -y
sleep 3
sudo dhclient -r
sleep 4

# stop this script
systemctl stop install.service
sleep 1
systemctl disable install.service
sleep 1
rm /etc/systemd/system/install.service
sleep 4

clear
####################################################################################
####################################################################################
####################################################################################
#                      rebooting the system ;) 
sleep 8 ; reboot
####################################################################################
####################################################################################
####################################################################################
