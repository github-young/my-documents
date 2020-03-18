#!/bin/zsh
for i in ./**/.git/; do ( echo "This is: $i"; cd $i/..; git pull; ); done
