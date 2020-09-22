#!/bin/bash

echo "[+] PWD is: $(pwd)"
echo "[+] Converting: $1"
iconv -f GBK -tUTF-8 $1 > $1.bak
mv $1.bak $1
echo "[+] Done."
