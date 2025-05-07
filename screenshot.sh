#!/bin/sh
APPNAME=screenshot
die() {
    heading=$1
    body=$2
    # shellcheck disable=SC2086
    notify-send -a "$APPNAME" -u critical "$heading" $body
}
notify() {
    heading=$1
    body=$2
    # shellcheck disable=SC2086
    notify-send -a "$APPNAME" -u low "$heading" $body
}

SCREENSHOT_DIR=${SCREENSHOT_DIR:-"$HOME/Pictures/screenshots/"}

err=$(mkdir -p "$SCREENSHOT_DIR" 2>&1) \
    || die "Could not create screenshot" "$err"

filename="$(printf "" | dmenu -l 0 )" || exit 0
filename=$SCREENSHOT_DIR/${filename:-$(date +'%F')}


ctr=0
while real_filename="$filename"_"$ctr".png \
    && [ -f "$real_filename" ]
do : $((ctr+=1)); done

killall unclutter && restore=1
err=$(import "$real_filename" 2>&1) || die "import error" "$err"
notify "$(basename "$real_filename")"
[ -n "$restore" ] && unclutter -b
