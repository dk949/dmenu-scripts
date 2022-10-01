#!/bin/bash
# XXX: Doesn't work atm
#$(awk '{for (i = 1; i <= NF; i++) print $i}' "$XDG_CONFIG_HOME"/bookmarks)
declare -A BOORMARKS

while read -r line; do
    BOORMARKS+=(["$(echo "$line" | cut -d' ' -f1)"]="$(echo "$line" | cut -d' ' -f2)")
done < "$XDG_CONFIG_HOME"/bookmarks

eval nohup "sh -c cd ${BOORMARKS["$(echo "${!BOORMARKS[@]}" | tr " " "\n" | dmenu -l 4 -g 5 -c)"]}; $TERMINAL" 1>/dev/null 2>/dev/null </dev/null  &
