#!/bin/bash
# @author Mike Jones - National Library of Wales

# Script to straighten images

# Loop through all the iamges
for a in *.jpg
do
 # make new directory if one doesn't already exist
 mkdir -p transformed transformed/holding transformed/final transformed/final/trash

 # convert the image and set the background colour
 echo "Converting $a"
 # inspired by http://greyproc.blogspot.co.uk/2012/03/batch-straighteningdeskewing-and.html
 convert $a -set filename:f "%t" -background '#e5e7e6' -deskew 60%  transformed/holding/%[filename:f].jpg;

 # run the multicrop script
 echo "Running crop tool"
 ./multicrop.sh -u 3 transformed/holding/$a transformed/final/$a
done

# because the multicrop keeps the greyscale patch as a seperate image we need to move
# image < 400px to a trash folder

echo "Running move script"
./move.sh