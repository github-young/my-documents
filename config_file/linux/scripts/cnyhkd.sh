RES=$(curl -s https://finance.yahoo.com/quote/CNYHKD\=X/)
echo "$RES" | grep -o -P ">1.{0,4}" | xargs | awk -F\> '{ print "100CNY = " 100*$2 "HKD" }'
echo "$RES" | grep -o -P ".{0,15}%\)<" 
