#!/bin/bash
for f in *.jpg
do
test=$(exiv2 -g Exif.Image.DateTime -Pv $f)
year=$(echo ${test::-14} | sed 's/\://g' | sed 's/\ //g')
month=$(echo ${test:4:-12} | sed 's/\://g' | sed 's/\ //g')
day=$(echo ${test:7:-8} | sed 's/\://g' | sed 's/\ //g')
fulldate=$(echo $year-$month-$day)
monthinletters=$(LANG=fr_FR.UTF-8 date -d $fulldate '+%B')
monthinletterscap=${monthinletters^}
path=$(echo $year/$monthinletterscap-$year/$day-$monthinletterscap-$year)
mkdir -p $path
exiv2 -r'%y%m%d-%H%M%S' -F rename $f
mv $f $path/
done
