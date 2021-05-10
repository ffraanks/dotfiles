#!/bin/bash
export LANG=C

if [ $(tty) = /dev/tty2 ]; then
     
      # wayland related
      export QT_QPA_PLATFORM=wayland
      export CLUTTER_BACKEND=wayland
      export SDL_VIDEODRIVER=wayland
      export MOZ_ENABLE_WAYLAND=1

      # keyboard related
      export XKB_DEFAULT_LAYOUT='br'
      export XKB_DEFAULT_VARIANT='abnt2'
      
      exec sway

#  startx
elif [ "$(tty)" = "/dev/tty1" ]; then
      exec startx
fi
