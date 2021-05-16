#!/bin/bash
MSG=$1
sudo echo -e "\e[3J" > /dev/tty1
sudo banner -w 200 -C -c "#" "${MSG} | $(date +"%H:%M")" > /dev/tty1
