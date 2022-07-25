#!/bin/sh

music_duration() {
    POSITION=$(cmus-remote -Q | grep -a '^position' | awk '{gsub("position ", "");print}')
    DURATION=$(cmus-remote -Q | grep -a '^duration' | awk '{gsub("duration ", "");print}')
    printf "%0d:%02d" $((POSITION%3600/60)) $((POSITION%60))
    printf " / %0d:%02d" $((DURATION%3600/60)) $((DURATION%60))
}

#poly_repeat() {
#REPEAT=$(cmus-remote -Q | grep 'repeat_current' | awk '{print $3}')
#STATUS=" "
#if [ "$REPEAT" = "false" ]; then
    #STATUS="   "
#else
    #STATUS="   "
#fi
#printf "$STATUS"
#}

mainf() {
if pgrep -x cmus >/dev/null
then
music_duration    
else
#sed 's/\|//'
printf "||| "
fi
}

mainf
