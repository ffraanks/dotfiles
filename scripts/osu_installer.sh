#!/bin/env bash
mkdir $HOME/.local/share/applications
clear && sudo pacman -S fuse wget --noconfirm
mkdir $HOME/.osu_game && cd $HOME/.osu_game && wget -c "https://github.com/ppy/osu/releases/download/2021.731.0/osu.AppImage" && chmod +x osu.AppImage && cd $HOME/.local/share/applications && wget -c "https://github.com/ffraanks/dotfiles/raw/master/osu.desktop" && clear
cd $HOME/.osu_game && ./osu.AppImage &
