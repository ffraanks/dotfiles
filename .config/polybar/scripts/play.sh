#!/bin/sh
poly_play() {
STATUS=$(cmus-remote -Q | grep -a '^status' | awk '{gsub("status ", "");print}')
if [ "$STATUS" = "playing" ]; then
    STATUS="  "
else
    STATUS="  "
fi
printf "$STATUS"
}

mainf() {
if pgrep -x cmus >/dev/null
then
poly_play
else
printf " "
fi
}

mainf
