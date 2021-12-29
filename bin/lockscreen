#!/bin/sh

# Run pywal colors.sh for color variables
source $HOME/.cache/wal/colors.sh

BLANK='#00000000'
CLEAR='#ffffff22'
#DEFAULT='#ff00ffcc'
DEFAULT=$color3
#TEXT='#ee00eeee'
TEXT=$color3
#WRONG='#880000bb'
WRONG=$color7
#VERIFYING='#bb00bbbb'
VERIFYING=$color4

i3lock \
--insidever-color=$CLEAR     \
--ringver-color=$VERIFYING   \
\
--insidewrong-color=$CLEAR   \
--ringwrong-color=$WRONG     \
\
--inside-color=$BLANK        \
--ring-color=$DEFAULT        \
--line-color=$BLANK          \
--separator-color=$DEFAULT   \
\
--verif-color=$TEXT          \
--wrong-color=$TEXT          \
--time-color=$TEXT           \
--date-color=$TEXT           \
--layout-color=$TEXT         \
--keyhl-color=$WRONG         \
--bshl-color=$WRONG          \
\
--screen 1                   \
--blur 5                     \
--clock                      \
--indicator                  \
--time-str="%I:%M %p"        \
--date-str="%A, %m %Y"       \
--keylayout 1                \
