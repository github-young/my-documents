#!/bin/zsh
_WDIR=${HOME}/Documents/repos
for i in ${_WDIR}/**/.git/; do ( echo "[+] in ${i%\/\.git\/}"; cd $i/..; git status -s; git pull; ); done
