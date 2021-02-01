#!/bin/bash -e

sed -i 4r<(sed '1,5!d' /etc/wpa_supplicant/wpa_template.template) /etc/wpa_supplicant/wpa_supplicant.conf
