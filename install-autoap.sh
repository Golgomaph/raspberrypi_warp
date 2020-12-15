#!/bin/bash -e

if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi

echo "Installing Auto Access Point"

echo "Install npm"
sudo apt-get -f install npm
echo "Install bower"
sudo npm install bower -g
#sudo apt-get install isc-dhcp-server
echo "Install git"
sudo apt-get install git
echo "Git clone"
git clone https://github.com/sabhiram/raspberry-wifi-conf.git
echo "cd raspberry-wifi-conf"
cd raspberry-wifi-conf
echo "npm update"
npm update
echo "bower --allow-root install"
bower --allow-root install
echo "npm run-script provision"
sudo npm run-script provision
echo "npm start"
sudo npm start
echo "cp assets/init.d/raspberry-wifi-conf /etc/init.d/raspberry-wifi-conf"
sudo cp assets/init.d/raspberry-wifi-conf /etc/init.d/raspberry-wifi-conf
echo "sudo chmod +x /etc/init.d/raspberry-wifi-conf"
sudo chmod +x /etc/init.d/raspberry-wifi-conf
echo "sudo systemctl unmask hostapd"
sudo systemctl unmask hostapd
echo "sudo systemctl enable hostapd"
sudo systemctl enable hostapd
echo "Finished."
echo "~"
