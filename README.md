# Fog Project Ubuntu 22.04 Images Sysprep
# Installer

mkdir -p /etc/installers

cd /etc/installers/

wget https://raw.githubusercontent.com/netwerkfix/ubuntu22.04-Sysprep/ef12cec1f9fdab49a2d16310df439b7640ee2aba/installer.sh

chmod 755 installer.sh
  
sudo ./installer.sh
