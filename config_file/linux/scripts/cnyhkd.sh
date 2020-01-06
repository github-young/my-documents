RES=$(curl -s https://finance.yahoo.com/quote/CNYHKD\=X/)
echo "$RES" | grep -o -P ">1.{0,5}" | xargs | awk -F\> '{ printf "100CNY = %.2fHKD\n", 100*$2 }'
echo "$RES" | grep -o -P ".{0,15}%\)<" | grep -o -P ">.{0,20}<"
