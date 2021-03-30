RES=$(curl -s https://finance.yahoo.com/quote/CNYHKD\=X/)
echo "$RES" | grep -o -E ">1\..{0,5}" | xargs | awk -F\> '{ printf "100HKD = %.2fCNY\n100CNY = %.2fHKD\n", 100/$2, 100*$2 }'
echo "$RES" | grep -o -E ".{0,15}%\)<" | grep -o -E ">.{0,20}<"
