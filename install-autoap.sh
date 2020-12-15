#!/bin/bash -e

if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi

echo "Installing Auto Access Point"

sudo apt-get -f install npm
sudo npm install bower -g
#sudo apt-get install isc-dhcp-server
sudo apt-get install git
git clone https://github.com/sabhiram/raspberry-wifi-conf.git
cd raspberry-wifi-conf
npm update
bower install
sudo npm run-script provision
sudo npm start
sudo cp assets/init.d/raspberry-wifi-conf /etc/init.d/raspberry-wifi-conf
sudo chmod +x /etc/init.d/raspberry-wifi-conf
sudo systemctl unmask hostapd
sudo systemctl enable hostapd
echo "Finished."
echo "~"
