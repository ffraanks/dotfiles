#!/bin/env bash

mkdir $HOME/Franks/.MineBackup
cd $HOME/Franks/.MineBackup && rm -rf *
SOUND=/usr/share/sounds/freedesktop/stereo/complete.oga && clear
cd $HOME/.minecraft && cp -r mods resourcepacks saves $HOME/Franks/.MineBackup
notify-send 'Backup do Minecraft finalizado com sucesso!!!' && mpv $SOUND
