#!/bin/bash

version=0.1

inputNames=$*

:<<EOF
while [[ "$1" =~ ^- && ! "$1" == "--" ]]; do case $1 in
  -V | --version )
    echo $version
    exit
    ;;
  -n | --name )
    shift; inputNames+=$1
    ;;
esac; shift; done
if [[ "$1" == '--' ]]; then shift; fi
EOF

#echo -n "Input a GitHub username: "
#read inputNames

#names='njudii github-young groupdu 54lH jiangsu'

for name in $inputNames; do
  res=$(curl -Is "https://github.com/$name" | head -1 | awk '{print $2}')
  #printf "%s\t%d\n" $name $res
  echo -e "$res \t $name"
done

echo "Done."
