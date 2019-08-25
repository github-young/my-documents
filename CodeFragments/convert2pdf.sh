#!/bin/bash
for i in {001..112}; do
    convert $i.gif $i.pdf
done
