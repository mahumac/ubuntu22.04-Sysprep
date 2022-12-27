# Fog Project Ubuntu 22.04 Images Sysprep
# Installer

mkdir -p /etc/installers

cd /etc/installers/

wget https://raw.githubusercontent.com/netwerkfix/ubuntu22.04-Sysprep/906d08f3e7078de088a8e0945f52ce1b5520f5ea/installer.sh
  
chmod 755 installer.sh
  
sudo ./installer.sh
