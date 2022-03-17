#!/bin/bash
# Dash screen simulator
# Miguel Leitao, ISEP
# v0.24, mar-2022
bname=dash_temp_img
img=dash.jpg
tmpdir=.
bpath=$tmpdir/$bname
repo=https://miguelleitao.gitlab.io/intmu/lab2
dist_table='1,1 268,122  1,599 257,409  799,599 780,406  799,1 770,130'
if ! [ -x "$(command -v convert)" ]; then
   echo "ImageMagick not found."
   exit;
fi
if [ ! -f "$1" ]; then
	echo "Usage: $0 image"
	exit;
fi
if [ ! -r $img ]; then
	wget -q $repo/$img -O $img
fi
convert $1 -gravity center -crop 800x600+0+0 +repage ${bpath}_c.png
convert ${bpath}_c.png -matte -virtual-pixel transparent -distort Perspective "$dist_table" ${bpath}_d.png
convert -composite $img ${bpath}_d.png ${bpath}_out.png
display ${bpath}_out.png 2>/dev/null
rm -f ${bpath}_*.png

