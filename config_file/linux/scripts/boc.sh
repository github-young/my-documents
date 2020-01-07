#!/bin/bash

RES=$(curl -s https://www.boc.cn/sourcedb/whpj/ | grep -A 6 "<td>港币" | awk -F "</*td" '{ print $2 }' | awk -F ">" '{print $2}')
echo $RES | awk '{ printf "BOC-buy-in:\t%.2f (%.2f)\nBOC-middle:\t%.2f (%.2f)\nReleased-at:\t%s\n", $2, 10000/$2, $6, 10000/$6, $8 }'

