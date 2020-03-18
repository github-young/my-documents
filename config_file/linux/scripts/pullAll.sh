#!/bin/zsh
for i in ./**/.git/; do ( echo "[+] in ${i%\/\.git\/}"; cd $i/..; git pull; ); done
