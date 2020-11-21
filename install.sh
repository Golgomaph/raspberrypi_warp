#!/bin/bash -e

read -p "Hostname [$(hostname)]: " HOSTNAME
sudo raspi-config nonint do_hostname ${HOSTNAME:-$(hostname)}

echo "Installing components"
sudo ./install-bluetooth.sh