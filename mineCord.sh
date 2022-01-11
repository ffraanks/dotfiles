#!/bin/env bash

clear
SOUND=/usr/share/sounds/freedesktop/stereo/complete.oga
cd $HOME/.local/bin
wget -c https://github.com/ffraanks/mine_coord/raw/master/mine_coordenates
wget -c https://github.com/ffraanks/mine_coord/raw/master/minec
wget -c https://github.com/ffraanks/mine_coord/raw/master/auto_save
wget -c https://github.com/ffraanks/mine_coord/raw/master/manager_save

chmod +x mine_coordenates
chmod +x minec
chmod +x auto_save
chmod +x manager_save
notify-send 'Minecord baixado com sucesso!' && mpv $SOUND
