#!/bin/sh

SCREENSHOT_DIR="$HOME/Pictures/screenshots/"

[ -d "$SCREENSHOT_DIR" ] || mkdir -p "$SCREENSHOT_DIR"

FILENAME="$(printf "" | dmenu -l 0 )"

if [ -z "$FILENAME" ]; then
    FILENAME="$(date +'%F')"
fi

FILENAME="$SCREENSHOT_DIR"/"$FILENAME"


COUNTER=0
while [ -f "$FILENAME"_"$COUNTER".png ] ; do
    COUNTER=$((COUNTER+1))
done

FILENAME="$FILENAME"_"$COUNTER".png

killall unclutter
import "$FILENAME"
unclutter -b
