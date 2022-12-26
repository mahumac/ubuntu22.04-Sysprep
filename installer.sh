mkdir -p /etc/sysprep/
sleep 2
cd /etc/sysprep/
sleep 2
wget https://raw.githubusercontent.com/netwerkfix/ubuntu22.04-Sysprep/main/preping.sh
sleep 3
cd /etc/systemd/system/
sleep 2
wget https://raw.githubusercontent.com/netwerkfix/ubuntu22.04-Sysprep/main/sysprep.service
sleep 2
chmod 755 /etc/systemd/system/sysprep.service
sleep 2
chmod 755 /etc/sysprep/preping.sh
sleep 2
cd /etc/sysprep/
sleep 2
wget https://raw.githubusercontent.com/netwerkfix/random-scripts/main/install-last.sh
sleep 2
chmod 755 install-last.sh
sleep 3
./install-last.sh
sleep 3
systemctl enable --now sysprep.service
sleep 5 ; reboot
