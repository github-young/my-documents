#!/bin/bash

echo "[+] Clear in path: $1"
cd "$1"
echo "[+] PWD is: $(pwd)"

rm -f *.aux
rm -f *.bbl
rm -f *.bcf
rm -f *.blg
rm -f *.dvi
rm -f *.fdb_latexmk
rm -f *.fls
rm -f *.log
rm -f *.nav
rm -f *.pdfsync
rm -f *.ps
rm -f *.run.xml
rm -f *.snm
rm -f *.synctex
rm -f *.toc
rm -f *.out
rm -f *.gz
rm -f *.xdv
