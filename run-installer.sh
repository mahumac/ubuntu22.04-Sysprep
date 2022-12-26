mkdir -p /etc/sysprep/
sleep 2
cd /etc/sysprep/
sleep 2
wget https://raw.githubusercontent.com/netwerkfix/ubuntu22.04-Sysprep/main/run.sh
sleep 3
cd /etc/systemd/system/
sleep 2
wget https://raw.githubusercontent.com/netwerkfix/ubuntu22.04-Sysprep/main/sysprep.service
sleep 2
chmod 755 /etc/systemd/system/sysprep.service
sleep 2
chmod 755 /etc/sysprep/run.sh
sleep 2
chmod 755 /etc/sysprep/delay-boot.sh
sleep 2
cd /etc/sysprep/
sleep 1
wget https://raw.githubusercontent.com/netwerkfix/random-scripts/main/install-last.sh
sleep 1
sudo ./install-last.sh
sleep 1
sytemctl enable --now sysprep.service
sleep 3 ; reboot
