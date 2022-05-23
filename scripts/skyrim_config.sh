#!/usr/bin/env bash

clear && [ ! `command -v unzip` ] && echo "unzip não instalado, por favor faça a instalação" && exit 1

clear
cd $HOME/Downloads && unzip Traducao-Skyrim-Special-Edition-24159-2-9-1636894034.zip && rm -rf "Traducao-Skyrim-Special-Edition-24159-2-9-1636894034.zip"
cd Data && cp -r Interface Strings $HOME/.steam/steam/steamapps/common/Skyrim Special Edition/Data
cd $HOME
clear && exit 0

