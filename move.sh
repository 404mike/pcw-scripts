#!/bin/bash
# @author Mike Jones - National Library of Wales

# Script to move greyscale patches to another directory

# Loop through all jpg
for a in transformed/final/*.jpg
do
 # make trash directory if there isn't one already
 mkdir -p transformed/final/trash
 # get the width of the image
 SIZE=`identify -format "%w" $a`
 # check to see if the width of the image is less than 400px
 # if it is move the image to the trash directory
 if [ $SIZE -lt 450 ]; then

  original_string=$a
  new_string=''
  result_string="${original_string/transformed\/final\//$new_string}"
  echo $result_string

  mv $a transformed/final/trash/$result_string
 fi
done

 # rename the file
 # the transform script will generate files with the following naming convention
 # $file-001.jpg or $file(1)-001.jpg - what we want is the original filename 
 # replace any (1) and -001 strings in the filename
 echo "Rename files"
 rename -v 's/(.?)(\(\d\))?-(\d{3})/$1/' transformed/final/*