#!/bin/env bash

SOUND=/usr/share/sounds/freedesktop/stereo/complete.oga && clear
cd $HOME/.BackupWallpapers && rm -rf * && cd && cp ~/Wallpapers/* ~/.BackupWallpapers && notify-send 'Backup de Wallpapers finalizado com sucesso' && mpv $SOUND
