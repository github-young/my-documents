#!/bin/bash
cat "/sys/class/net/$1/statistics/tx_bytes" | awk '{ printf "%.2fMB\n", $1/1024.0/1024.0 }'
