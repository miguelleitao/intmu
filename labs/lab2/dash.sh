#!/bin/bash
# Dash screen simulator
# Miguel Leitao, ISEP
# v0.26, mar-2025
bname=dash_temp_img
img=dash.jpg
tmpdir=.
bpath=$tmpdir/$bname
repo=https://miguelleitao.github.io/intmu/lab2
dist_table='1,1 268,122  1,599 257,409  799,599 780,406  799,1 770,130'
imagick=magick
matteopt="-alpha Set"
if ! [ -x "$(command -v magick)" ]; then
    imagick=convert
    matteopt=-matte
    if ! [ -x "$(command -v $imagick)" ]; then
       echo "ImageMagick not found."
       exit;
    fi
fi
if [ ! -f "$1" ]; then
	echo "Usage: $0 image"
	exit;
fi
if [ ! -r $img ]; then
	wget -q $repo/$img -O $img
fi
${imagick} $1 -gravity center -crop 800x600+0+0 +repage ${bpath}_c.png
${imagick} ${bpath}_c.png -alpha Set -virtual-pixel transparent -distort Perspective "$dist_table" ${bpath}_d.png
ls -l ${bpath}_d.png
${imagick} $img ${bpath}_d.png -composite ${bpath}_out.png
display ${bpath}_out.png 2>/dev/null
rm -f ${bpath}_*.png

