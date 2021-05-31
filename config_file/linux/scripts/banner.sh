#!/bin/bash
MSG=$1
echo -e "\e[3J" | sudo tee /dev/tty1 > /dev/null
banner -w 200 -C -c "#" "${MSG} | $(date +"%a %H:%M")" | sudo tee /dev/tty1 > /dev/null
