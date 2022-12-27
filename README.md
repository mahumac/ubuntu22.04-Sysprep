# Fog Project Ubuntu 22.04 Images Sysprep
# Installer

mkdir -p /etc/installers

cd /etc/installers/

wget https://raw.githubusercontent.com/netwerkfix/ubuntu22.04-Sysprep/be0d69b0a8d06411b6f83f0582395cdd147925da/installer.sh

chmod 755 installer.sh
  
sudo ./installer.sh
