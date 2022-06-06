#!/usr/bin/env bash

# Get spotify tab name info
var=$(bt list | grep "https://open.spotify.com")
var=$(echo ${var%"https"*} | awk '{first=$1; $1=""; print $0; }')

# Exit if spotify is not found
if [[ -z $var ]] ; then
    echo " Spotify web closed"
    exit 0
fi

# Print
strMaxLen=100
checkPaused=$(echo $var | awk '{print $1}')
if [[ $checkPaused = "Spotify" ]] ; then
    echo " Spotify is paused"
else
    song=${var%·*}
    artist=${var#*·}
    str=" $artist:$song"
    strLen=$(echo -n "$str" | wc -c)
    if (( $strLen > $strMaxLen )) ; then
        echo "${str:(0):($strMaxLen)}..."
    else
        echo "$str"
    fi
fi
