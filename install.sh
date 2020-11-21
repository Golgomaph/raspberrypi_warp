#!/bin/bash -e

read -p "Hostname [$(hostname)]: " HOSTNAME
sudo raspi-config nonint do_hostname ${HOSTNAME:-$(hostname)}

echo "Updating packages"
sudo apt update
sudo apt upgrade -y

echo "Installing components"
sudo ./install-bluetooth.sh