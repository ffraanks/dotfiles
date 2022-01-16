#!/bin/env bash

clear
SOUND=/usr/share/sounds/freedesktop/stereo/complete.oga
cd $HOME/.local/bin
wget -c https://github.com/ffraanks/smartphone-on-pc/raw/master/scrcpy-cli
wget -c https://github.com/ffraanks/smartphone-on-pc/raw/master/cabo-usb
wget -c https://github.com/ffraanks/smartphone-on-pc/raw/master/cabo-resolution
wget -c https://github.com/ffraanks/smartphone-on-pc/raw/master/wifi-connect
wget -c https://github.com/ffraanks/smartphone-on-pc/raw/master/wifi-resolution
chmod +x scrcpy-cli
chmod +x cabo-usb
chmod +x cabo-resolution
chmod +x wifi-connect
chmod +x wifi-resolution
cd && clear && notify-send 'Smartphone on PC baixadoo com Sucesso!!!' && mpv $SOUND
