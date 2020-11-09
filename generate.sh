#!/bin/sh

WD="$1"
IN="$2"
OUT="$3"
CSS="$4"
TITLE="$5"

cd /github/workspace/"$WD"
git fetch --tags
H=`git log -1 --pretty=format:%H .`
ver=`git describe --tags $H`
echo VER=$ver

unixtime=`git show -s --format=%ct`
date=`date --date=@$unixtime +%F`
echo DATE=$date

sed "0,/\[VER\]/ s//$ver/g" "$IN" | sed "0,/\[DATE\]/ s//$date/g" | pandoc --from gfm --to html5 -N --css /github/workspace/"$CSS" --standalone -M title="$TITLE" -o "$OUT"
