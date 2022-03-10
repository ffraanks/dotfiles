#!/bin/env bash

clear
mkdir $HOME/.Music
clear && printf "Download Music YouTube\n\nCole o Link do video abaixo:\n\n"
read URL_YT
cd $HOME/.Music && youtube-dl -x --audio-format mp3 "$URL_YT"
read -p 'DOWNLOAD FINALIZADO PRESSIONE ENTER PARA SAIR...' && clear && exit 0

