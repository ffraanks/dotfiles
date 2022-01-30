#!/bin/env bash

clear
my_array=($HOME/Wallpapers/*)
wal -i ${my_array[$(( $RANDOM % ${#my_array[@]}))]} && $HOME/.config/dunst/./launchdunst.sh && $HOME/.telegram-palette-gen/telegram-palette-gen --wal && i3-msg restart
