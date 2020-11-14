#!/bin/bash
if [ -z "$exc" ]
then
    source functions.sh
    source dependencies.sh
fi
if [ -z "$GMediaName" ]
then
    read -p "UPnP Device Name: " GMediaName
fi
# Install Dependencies
for _dep in ${GMEDIA_DEPS[@]}; do
    apt_install $_dep;
done
# Download Package
exc remove_dir gmrender-resurrect
exc git clone https://github.com/hzeller/gmrender-resurrect.git
exc cd gmrender-resurrect
# Setup Package
exc ./autogen.sh
exc ./configure
# Install Package
exc make
exc make install

# Add line to /etc/rc.local to allow for startup on boot
save_original /etc/rc.local
sed -i -e "\$i \/usr/local/bin/gmediarender -f $GMediaName&\n" /etc/rc.local
