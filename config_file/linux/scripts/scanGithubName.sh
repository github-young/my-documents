#!/bin/bash

names='njudii github-young groupdu 54lH jiangsu'

for name in $names
do
  res=$(curl -Is "https://github.com/$name" | head -1 | awk '{print $2}')
  #printf "%s\t%d\n" $name $res
  echo -e "$res \t $name"
done

