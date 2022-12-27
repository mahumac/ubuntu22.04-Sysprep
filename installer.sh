#!/bin/bash
######################################################
#### WARNING PIPING TO BASH IS STUPID: DO NOT USE THIS
######################################################
# TESTED ON UBUNTU 22.04.1 LTS (Works for me)

if [ `id -u` -ne 0 ]; then
	echo Need sudo
	exit 1
fi

set -v

sleep 2
clear

######################################################################################
######################################################################################
#                               Installation ubuntu                                  #
#		---------------------------------------------------                  #
#                            By Netwerkfix Datacenter                                #
#                                                                                    #
######################################################################################
######################################################################################


#update apt-cache &> /dev/null
apt update -y
apt upgrade -y

#install packages
apt install pwgen
sleep 1
apt install -y qemu-guest-agent
sleep 1
/bin/rm -v /etc/ssh/ssh_host_*
sleep 1
dpkg-reconfigure openssh-server
sleep 1
sudo systemctl restart ssh

#reset hostname
truncate -s0 /etc/hostname
hostnamectl set-hostname netwerkfix-dc

#reset machine-id
truncate -s0 /etc/machine-id

#cleanup apt
apt clean

# disable swap
sudo swapoff --all
sudo sed -ri '/\sswap\s/s/^#?/#/' /etc/fstab

#cleanup shell history
cat /dev/null > ~/.bash_history && history -c
history -w

#disk biger-maker (proxmox virtial disk)
pvresize /dev/vda3
lvextend -l +100%FREE /dev/mapper/ubuntu--vg-ubuntu--lv
resize2fs /dev/mapper/ubuntu--vg-ubuntu--lv

#disk biger-maker (hard-disk)
#pvresize /dev/sda3
#lvextend -l +100%FREE /dev/mapper/ubuntu--vg-ubuntu--lv
#resize2fs /dev/mapper/ubuntu--vg-ubuntu--lv

dhclient -r
sleep 2
systemctl restart networking
sleep 1

shutdown -h +6

# stop this script
systemctl stop install.service
systemctl disable install.service
rm /etc/systemd/system/install.service
clear
######################################################################################
######################################################################################
#                             Installation Succesful                                 #
#		---------------------------------------------------                  #
#                            By Netwerkfix Datacenter                                #
#                                                                                    #
######################################################################################
######################################################################################
