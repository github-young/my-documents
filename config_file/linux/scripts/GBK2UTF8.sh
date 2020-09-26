#!/bin/bash

_proceedFlag="N"

echo "[+] PWD is: $(pwd)"
echo "[+] Converting: $1. Proceed? [y/N]:"
read _proceedFlag
if [[ ${_proceedFlag} == "y" ]]; then
  iconv -f GBK -t UTF-8 $1 > $1.bak
  mv $1.bak $1
  echo "[+] Done."
else
  echo "[-] Unchanged."
fi
