#!/bin/bash -e

read -p "Hostname [$(hostname)]: " HOSTNAME
sudo raspi-config nonint do_hostname ${HOSTNAME:-$(hostname)}

CURRENT_PRETTY_HOSTNAME=$(hostnamectl status --pretty)
read -p "Pretty hostname [${CURRENT_PRETTY_HOSTNAME:-Raspberry Pi}]: " PRETTY_HOSTNAME
sudo hostnamectl set-hostname --pretty "${PRETTY_HOSTNAME:-${CURRENT_PRETTY_HOSTNAME:-Raspberry Pi}}"

echo "Updating packages"
sudo apt update
sudo apt upgrade -y

echo
echo -n "Do you want to stream audio via bluetooth (BlueALSA)? [y/N] "
read REPLYBLUETOOTH
echo -n "Do you want to stream audio via WiFi-UPnP (gmrender-resurrect)? [y/N] "
read REPLYUPNP
echo -n "Do you want to stream audio via Apple AirPlay (shairport-sync)? [y/N] "
read REPLYSHAIRPORT
echo -n "Do you want to see RasPi as streaming device in Spotify (Raspotify)? [y/N] "
read REPLYSPOTIFY
echo -n "Do you want to use multi-room functionality using more then one RasPi (snapclient})? [y/N] "
read REPLYSNAPCAST

echo "Installing components"
if [[ "$REPLYBLUETOOTH" =~ ^(yes|y|Y)$ ]]; then sudo ./install-bluetooth.sh; fi;
if [[ "$REPLYUPNP" =~ ^(yes|y|Y)$ ]]; then sudo ./install-upnp.sh; fi;
if [[ "$REPLYSHAIRPORT" =~ ^(yes|y|Y)$ ]]; then sudo ./install-shairport.sh; fi;
if [[ "$REPLYSPOTIFY" =~ ^(yes|y|Y)$ ]]; then sudo ./install-spotify.sh; fi;
if [[ "$REPLYSNAPCAST" =~ ^(yes|y|Y)$ ]]; then sudo ./install-snapcast-client.sh; fi;

#sudo ./install-pivumeter.sh
#sudo ./enable-hifiberry.sh
#sudo ./enable-read-only.sh

sudo ./rebootafterfinish.sh
