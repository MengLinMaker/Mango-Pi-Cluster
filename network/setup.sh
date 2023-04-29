#!/bin/sh

# Enable ssh capability
touch /boot/ssh

# Setup batman-adv WiFi mesh
sudo apt install -y batctl

echo 'batman-adv' | sudo tee --append /etc/modules
echo 'denyinterfaces wlan0' | sudo tee --append /etc/dhcpcd.conf

# Execute start-batman-adv on boot
cp start-batman-adv.sh /etc
chmod +x /etc/start-batman-adv.sh
sed -i '2 i /etc/start-batman-adv.sh &' /etc/rc.local

cp wlan0 /etc/network/interfaces.d