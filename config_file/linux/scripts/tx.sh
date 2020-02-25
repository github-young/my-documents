#!/bin/bash

_CAT=/usr/bin/cat
_AWK=/usr/bin/awk

$_CAT "/sys/class/net/$1/statistics/tx_bytes" | $_AWK '{ printf "%.2fMB\n", $1/1024.0/1024.0 }'
