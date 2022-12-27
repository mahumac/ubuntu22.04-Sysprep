# Fog Project Ubuntu 22.04 Images Sysprep
# Installer

mkdir -p /etc/installers

cd /etc/installers/

wget https://raw.githubusercontent.com/netwerkfix/ubuntu22.04-Sysprep/8032949740bb42efa35d5b0d9dd398f72c21a04e/installer.sh

chmod 755 installer.sh
  
sudo ./installer.sh
