#!/bin/bash

echo "[+] Clear in path: $1"
cd "$1"
echo "[+] PWD is: $(pwd)"

rm *.aux
rm *.bbl
rm *.bcf
rm *.blg
rm *.dvi
rm *.fdb_latexmk
rm *.fls
rm *.log
rm *.nav
rm *.pdfsync
rm *.ps
rm *.run.xml
rm *.snm
rm *.synctex
rm *.toc
rm *.out
rm *.gz
rm *.xdv
