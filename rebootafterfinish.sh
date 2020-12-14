#!/bin/bash -e

echo
echo -n "----------------------------------------------------------------"
echo
echo -n "Installation finished. Reboot now? [y/N] "
read REPLY
if [[ ! "$REPLY" =~ ^(yes|y|Y)$ ]]; then exit 0; fi
sudo reboot
