#!/usr/bin/env bash

# Script para instalar a tradução no Skyrim Special Edition Steam

clear && [ ! `command -v unzip` ] && echo "unzip não instalado, por favor faça a instalação" && exit 1

clear
cd $HOME/Downloads && unzip Traducao-Skyrim-Special-Edition-24159-2-9-1636894034.zip && rm -rf "Traducao-Skyrim-Special-Edition-24159-2-9-1636894034.zip"
cd $HOME/Downloads/Data && cp -r * ~/.steam/steam/steamapps/common/Skyrim\ Special\ Edition/Data/
cd $HOME/Downloads && rm -rf Data Informações.txt && cd %HOME
clear && read -p 'PRESSIONE ENTER PARA SAIR...' && clear && exit 0
