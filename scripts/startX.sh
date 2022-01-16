#!/bin/env bash

while true ; do
  clear
  printf "
███████╗████████╗ █████╗ ██████╗ ████████╗██╗  ██╗
██╔════╝╚══██╔══╝██╔══██╗██╔══██╗╚══██╔══╝╚██╗██╔╝
███████╗   ██║   ███████║██████╔╝   ██║    ╚███╔╝ 
╚════██║   ██║   ██╔══██║██╔══██╗   ██║    ██╔██╗ 
███████║   ██║   ██║  ██║██║  ██║   ██║   ██╔╝ ██╗
╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝
\n\n"

  printf "Qual você deseja logar?\n\n[1] - i3-Gaps\n[2] - Sway\n[3] - Sair\n\n"
  read ESCOLHA

  if [ $ESCOLHA == '1' ] || [ $ESCOLHA == '01' ] ; then
    exec startx

  elif [ $ESCOLHA == '2' ] || [ $ESCOLHA == '02' ] ; then
    ## wayland related
    export QT_QPA_PLATFORM=wayland
    export CLUTTER_BACKEND=wayland
    export SDL_VIDEODRIVER=wayland
    export MOZ_ENABLE_WAYLAND=1

    ## keyboard related
    export XKB_DEFAULT_LAYOUT='br'
    export XKB_DEFAULT_VARIANT='abnt2'

    exec sway

  elif [ $ESCOLHA == '3' ] || [ $ESCOLHA == '03' ] ; then
    clear && exit 0

  else
    clear && continue
  fi
done

