#!/bin/bash

# script to convert tif files to jpg
# @author Mike Jones - National Library of Wales

for f in *.tif
do
 filename=$(basename "$f")
 extension="${f##*.}"
 filename="${f%.*}"
 echo "Converting $f"
 convert $f "$filename.jpg"
done