#!/bin/bash

#get all the jpg files of the current folder
for f in *.jpg

# get the date in the exif data for each photo
do
timestamp=$(exiv2 -g Exif.Image.DateTime -Pv $f)

# from the timestamp, get the year, month and day seperately
year=$(echo ${timestamp::-14} | sed 's/\://g' | sed 's/\ //g')
month=$(echo ${timestamp:4:-12} | sed 's/\://g' | sed 's/\ //g')
day=$(echo ${timestamp:7:-8} | sed 's/\://g' | sed 's/\ //g')

# get the full date in order 
fulldate=$(echo $year-$month-$day)

# get the month name in letters
monthinletters=$(date -d $fulldate '+%B')
monthinletterscap=${monthinletters^}

# set the destination folder
path=$(echo $year/$monthinletterscap-$year/$day-$monthinletterscap-$year)

# create the folders
mkdir -p $path

# rename the files
exiv2 -r'%y%m%d-%H%M%S' -F rename $f

# move the files to the destination folder 
mv $f $path/
done
