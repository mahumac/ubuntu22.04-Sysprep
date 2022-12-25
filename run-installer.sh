mkdir -p /etc/sysprep/
cd /etc/sysprep/
wget https://raw.githubusercontent.com/netwerkfix/ubuntu22.04-Sysprep/main/run.sh

cd /etc/systemd/system/
wget https://raw.githubusercontent.com/netwerkfix/ubuntu22.04-Sysprep/main/sysprep.service

chmod 755 /etc/systemd/system/sysprep.service
chmod 755 /etc/sysprep/run.sh
chmod 755 /etc/sysprep/delay-boot.sh

sytemctl enable --now sysprep.service
sleep 10 ; reboot
