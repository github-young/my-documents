#!/bin/bash

#RES=$(curl -s https://www.boc.cn/sourcedb/whpj/ | grep -A 6 "<td>港币" | awk -F "</*td" '{ print $2 }' | awk -F ">" '{print $2}')
#echo $RES | awk '{ printf "BOC-buy-in:\t%.2f (%.2f)\nBOC-middle:\t%.2f (%.2f)\nReleased-at:\t%s\n", $2, 10000/$2, $6, 10000/$6, $8 }'

RES=$(curl -s https://www.bankofchina.com/sourcedb/whpj/sjmfx_1621.html)
getEr=$(echo "$RES" | grep -A 4 "HKD" | awk -F"<td>" '{ print $2}' | awk -F\<\/td\> '{ print $1 }' | xargs)
releaseTime=$(echo "$RES" | grep -A 1 "time" | sed -e '1d' | xargs | sed -e 's/<\/p>//g' | awk '{ print $2 }')
echo -e "Released-at:\t"$releaseTime
echo $getEr | awk '{ printf "BOC-buy-in:\t%.2f (%.2f)\nBOC-sell-out:\t%.2f (%.2f)\n", $2, 10000/$2, $4, 10000/$4}'
