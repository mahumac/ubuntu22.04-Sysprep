# Fog Project Ubuntu 22.04 Images Sysprep
# Installer

mkdir -p /etc/installers

cd /etc/installers/

wget https://raw.githubusercontent.com/netwerkfix/ubuntu22.04-Sysprep/df19c70af27864f2e9f8956fa13a9c6a0fb47884/installer.sh

chmod 755 installer.sh
  
sudo ./installer.sh
