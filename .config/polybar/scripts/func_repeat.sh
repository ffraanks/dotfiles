#!/bin/sh

poly_repeat() {
REPEAT=$(cmus-remote -Q | grep 'repeat_current' | awk '{print $3}')
if [ "$REPEAT" = "false" ]; then
    cmus-remote -C set\ repeat_current=true
else
    cmus-remote -C set\ repeat_current=false
fi
}
poly_repeat