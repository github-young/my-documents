#!/bin/bash

#echo "nmcli status is:"
nmcli device status

if [[ "$1" == "on" ]]; then
  sudo nmcli device wifi hotspot ifname wlp0s26u1u con-name 4137 ssid 4137 band bg channel 8 password xykindle
fi

if [[ "$1" == "off" ]]; then
  sudo nmcli device disconnect wlp0s26u1u
fi
