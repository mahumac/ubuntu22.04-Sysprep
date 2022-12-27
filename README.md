# Fog Project Ubuntu 22.04 Images Sysprep
# Installer

mkdir -p /etc/installers

cd /etc/installers/

wget https://raw.githubusercontent.com/netwerkfix/ubuntu22.04-Sysprep/d527d5f232939e8ad2176b75b5b92cc928b3313b/installer.sh

chmod 755 installer.sh
  
sudo ./installer.sh
