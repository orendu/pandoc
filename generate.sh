#!/bin/sh

IN="$1"
OUT="$2"
TITLE="$3"

cd /github/workspace
git fetch --tags
ver=`git describe --tags`
echo VER=$ver

unixtime=`git show -s --format=%ct`
date=`date --date=@$unixtime +%F`
echo DATE=$date
id
ls -l /github/workspace/
ls -l /github/workspace/css
sed "0,/\[VER\]/ s//$ver/g" "$IN" | sed "0,/\[DATE\]/ s//$date/g" | pandoc --from gfm --to html5 -N --css /github/workspace/css/github-typora2.css --standalone -M title="$TITLE" -o "$OUT".pdf
