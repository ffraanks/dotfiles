#!/bin/env bash

clear && mkdir $HOME/.config/mpv
clear && cd $HOME/.config/mpv && mkdir scripts && mkdir scripts-opts && cd
clear && cd $HOME/.config/mpv/scripts && wget -c "https://github.com/ffraanks/dotfiles/raw/master/youtube-quality.lua" && clear
cd $HOME/.config/mpv/scripts-opts && wget -c "https://github.com/ffraanks/dotfiles/raw/master/youtube-quality.conf" && cd
clear && exit 0

