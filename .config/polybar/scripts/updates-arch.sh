#!/bin/env bash
# Credit: Franklin Souza
# Telgram: @FranklinTech
#
# Script da polybar para mostrar atualizações do Arch Linux
#
if ! updates=$(checkupdates 2> /dev/null | wc -l ); then
    updates=0
fi

if [ "$updates" -gt 0 ]; then
    echo "  $updates "
else
    echo "  No updates"
fi
