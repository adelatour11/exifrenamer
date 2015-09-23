# exifrenamer

This little script automatically organizes your photos based on the date defined in the exif data.
Let's say you have a long list of photos in a folder, with this script you can automatically rename and reorder the photos based on the dates.

The script will extract the timestamp of each photo, will rename the files based on the timestamp and will move each photo to its folder destination based on the date : Year/MonthName/Day/timestamp.jpg 

to make it work you need to install exiftools first :
apt-get install libimage-exiftool-perl

Then download the shell script on your machine and simply run sh /exifrenamer.sh

