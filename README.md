# Fog Project Ubuntu 22.04 Images Sysprep
# Installer

mkdir -p /etc/installers

cd /etc/installers/

wget https://raw.githubusercontent.com/netwerkfix/ubuntu22.04-Sysprep/85f98cfa627b273179e412e4b03ad81729b06d17/installer.sh

chmod 755 installer.sh
  
sudo ./installer.sh
