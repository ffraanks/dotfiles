#!/bin/sh

poly_repeat() {
REPEAT=$(cmus-remote -Q | grep 'repeat_current' | awk '{print $3}')
STATUS=" "
if [ "$REPEAT" = "false" ]; then
    STATUS="  "
else
    STATUS="  "
fi
printf "$STATUS"
}

mainf() {
if pgrep -x cmus >/dev/null
then
poly_repeat    
else
printf " "
fi
}

mainf