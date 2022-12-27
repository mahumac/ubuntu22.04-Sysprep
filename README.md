# Fog Project Ubuntu 22.04 Images Sysprep
# Installer

mkdir -p /etc/installers

cd /etc/installers/

wget https://raw.githubusercontent.com/netwerkfix/ubuntu22.04-Sysprep/6e1add51f4995cd2283486792ef3346eb695f6af/installer.sh

chmod 755 installer.sh
  
sudo ./installer.sh
