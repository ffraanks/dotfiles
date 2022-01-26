#!/bin/env bash

##########################################################
# Credit: Franklin Souza                                 #
# Telegram: @FranklinTech                                #
# Script do Epic Games CLI                               #
# Repo: https://github.com/derrod/legendary              #
# AUR: https://aur.archlinux.org/packages/legendary/     #
##########################################################

clear
printf "Primeiro você tem que ter o legendary na sua maquina:\n\n"
printf "Repositório: https://github.com/derrod/legendary\n"
printf "AUR: https://aur.archlinux.org/packages/legendary/\n\n"
read -p 'PRESS ENTER TO CONTINUE...'

wine_install(){
clear
cat << EOF
Digite sua senha sudo para instalar pacotes

AVISO: Esse programa necessita do wine e suas deps para a execução dos games (Possa ser que NEM TODOS OS GAMES FUNCIONEM, mais uma grande parte pode pegar)
EOF
printf "\nDeseja instalar o wine e suas deps (RECOMENDADO)?\n\n"
printf "[01] - Sim, desejo baixar\n"
printf "[02] - Não, continue...\n"
printf "[03] - Baixar e instalar Mangohud\n"
printf "[04] - Desinstalar Mangohud\n"
printf "[05] - Sair\n\n"
read WINE_INSTALL
printf "\n\n"

if [ $WINE_INSTALL == '1' ] || [ $WINE_INSTALL == '01' ] ;then
  printf "\n"
  sudo pacman -S wine-staging giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader --noconfirm

elif [ $WINE_INSTALL == '2' ] || [ $WINE_INSTALL == '02' ] ; then
  continue

elif [ $WINE_INSTALL == '3' ] || [ $WINE_INSTALL == '03' ] ; then
  clear
  printf "Mangohud é um software para você acompanhar o desempenho do seu game, uma alternativa para MSI Afterburner!!!\n\nEu estou considerando que você tenha pacotes de compilação para poder compilar o Mangohud!!!\n\n"
  read -p 'PRESS ENTER TO COMPILE MANGOHUD...' && clear
  mkdir $HOME/.projects && clear
  cd $HOME/.projects && git clone --recurse-submodules https://github.com/flightlessmango/MangoHud.git
  cd MangoHud
  meson build
  ninja -C build install
  ./build.sh install && cd
  wine_install

elif [ $WINE_INSTALL == '4' ] || [ $WINE_INSTALL == '04' ] ; then
  clear
  printf "Certeza que deseja desinstalar o Mangohud? [y/n]\n\n"
  read MANGOHUD_UNINSTALL
  if [ $MANGOHUD_UNINSTALL == 'y' ] || [ $MANGOHUD_UNINSTALL == 'Y' ] || [ $MANGOHUD_UNINSTALL == 'yes' ] || [ $MANGOHUD_UNINSTALL == 'YES' ] || [ $MANGOHUD_UNINSTALL == 'Yes' ] ; then
    cd $HOME/.projects
    cd MangoHud && ./build.sh uninstall && clear && wine_install

  elif [ $MANGOHUD_UNINSTALL == 'n' ] || [ $MANGOHUD_UNINSTALL == 'N' ] || [ $MANGOHUD_UNINSTALL == 'no' ] || [ $MANGOHUD_UNINSTALL == 'No' ] || [ $MANGOHUD_UNINSTALL == 'NO' ] ; then
    clear
    wine_install
  fi

elif [ $WINE_INSTALL == '5' ] || [ $WINE_INSTALL == '05' ] ; then
  clear && exit

else
  read -p " Opção inválida, por favor tente novamente (PRESS ENTER TO CONTINUE...)" && wine_install
fi
}

wine_install

# Title - Main
while true ; do
clear
SOUND=/usr/share/sounds/freedesktop/stereo/complete.oga && clear
printf "
 ███████╗██████╗ ██╗ ██████╗     ██████╗  █████╗ ███╗   ███╗███████╗███████╗     ██████╗██╗     ██╗
 ██╔════╝██╔══██╗██║██╔════╝    ██╔════╝ ██╔══██╗████╗ ████║██╔════╝██╔════╝    ██╔════╝██║     ██║
 █████╗  ██████╔╝██║██║         ██║  ███╗███████║██╔████╔██║█████╗  ███████╗    ██║     ██║     ██║
 ██╔══╝  ██╔═══╝ ██║██║         ██║   ██║██╔══██║██║╚██╔╝██║██╔══╝  ╚════██║    ██║     ██║     ██║
 ███████╗██║     ██║╚██████╗    ╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗███████║    ╚██████╗███████╗██║
 ╚══════╝╚═╝     ╚═╝ ╚═════╝     ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝╚══════╝     ╚═════╝╚══════╝╚═╝
                                                                                                  "
printf "\n"
printf "Escolha uma das opções abaixo:\n\n"
printf "[01] - Logar/Deslogar da Epic Games\n"
printf "[02] - Status\n"
printf "[03] - Listar jogos\n"
printf "[04] - Instalar jogo\n"
printf "[05] - Sincronizar os jogos\n"
printf "[06] - Desinstalar jogo\n"
printf "[07] - Executar um jogo\n"
printf "[08] - Listar jogos instalados e checar atualizações\n"
printf "[09] - Voltar\n"
printf "[10] - Sair do programa\n\n"
read EPIC_GAMES
printf "\n"

if [ $EPIC_GAMES == '1' ] || [ $EPIC_GAMES == '01' ] ; then
  clear
  printf " O que deseja fazer?:\n\n"
  printf " [01] - Logar\n"
  printf " [02] - Deslogar\n\n"
  read LOGIN
  printf "\n\n"
  
  if [ $LOGIN == '1' ] || [ $LOGIN == '01' ] ; then
    legendary auth && echo && read -p ' Logado(a) com sucesso (PRESS ENTER TO CONTINUE...)'

  elif [ $LOGIN == '2' ] || [ $LOGIN == '02'] ; then
    legendary auth --delete && echo && read -p ' Deslogado(a) com sucesso (PRESS ENTER TO CONTINUE...)'
  fi

elif [ $EPIC_GAMES == '2' ] || [ $EPIC_GAMES == '02' ] ; then
  clear
  legendary status && echo && read -p ' PRESS ENTER TO CONTINUE...'

  elif [ $EPIC_GAMES == '3' ] || [ $EPIC_GAMES == '03' ] ; then
    clear
    legendary list-games && echo && read -p ' PRESS ENTER TO CONTINUE...'

  elif [ $EPIC_GAMES == '4' ] || [ $EPIC_GAMES == '04' ] ; then
    clear
    printf " Escolha uma das opções abaixo:\n\n"
    printf " [01] - Instalar jogo no PATH atual\n"
    printf " [02] - Instalar jogo em PATH desejado\n\n"
    read INSTALL_GAME
    echo 
    
    if [ $INSTALL_GAME == '1' ] || [ $INSTALL_GAME == '01' ] ; then
      clear
      printf "Digite o APP Name:\n\n"
      read APP_NAME
      legendary install "$APP_NAME1" --base-path "$PATH_GAME" && echo && dunstify "EpicGames" "\nJogo Baixado com sucesso!!!" && mpv $SOUND && read -p 'Download finalizado com sucesso (PRESS ENTER TO CONTINUE...)'
      clear
    
    elif [ $INSTALL_GAME == '2' ] || [ $INSTALL_GAME == '02' ] ; then
      clear
      printf "Digite o APP Name do jogo:\n\n"
      read APP_NAME1
      printf "\n\nAgora digite o PATH que deseja instalar (Ex: /home/user/Epic_Games)\n\n"
      read PATH_GAME
      printf "\n\n"
      legendary install "$APP_NAME1" --base-path "$PATH_GAME" && echo && dunstify "EpicGames" "\nJogo Baixado com sucesso!!!" && mpv $SOUND && read -p 'Download finalizado com sucesso (PRESS ENTER TO CONTINUE...)'
    fi

  elif [ $EPIC_GAMES == '5' ] || [ $EPIC_GAMES == '05' ] ; then 
    clear
    legendary sync-saves
    legendary -y egl-sync

  elif [ $EPIC_GAMES == '6' ] || [ $EPIC_GAMES == '06' ] ; then
    clear
    printf "Digite aqui o APP Name para desinstalar um jogo (PRESS ENTER TO CANCEL):\n\n"
    read UNINSTALL
    echo 
    legendary uninstall "$UNINSTALL"

  elif [ $EPIC_GAMES == '7' ] || [ $EPIC_GAMES == '07' ] ; then
    clear
    printf "Escolha uma das opções:\n\n"
    printf "[01] - Jogar com internet\n"
    printf "[02] - Jogar sem internet\n"
    read LAUNCH_GAME
    echo

    if [ $LAUNCH_GAME == '1' ] || [ $LAUNCH_GAME == '01' ] ; then
      clear
      printf "Deseja executar com mangohud? [y/n]\n\n"
      read MANGOHUD1
    
      if [ $MANGOHUD1 == 'y' ] || [ $MANGOHUD1 == 'yes' ] || [ $MANGOHUD1 == 'Yes' ] || [ $MANGOHUD1 == 'YES' ] ; then
      printf "\nMANGOHUD ATIVO - Digite aqui o APP Name para executar um jogo:\n\n"
      read EXECUTE
      mangohud --dlsym legendary launch "$EXECUTE" && clear
    
    elif [ $MANGOHUD1 == 'n' ] || [ $MANGOHUD1 == 'N'] || [ $MANGOHUD1 == 'no' ] || [ $MANGOHUD1 == 'NO' ] ; then
      printf "\nMANGOHUD DESATIVADO - Digite aqui o APP Name para executar um jogo:\n\n"
      read EXECUTE
      legendary launch "$EXECUTE" && clear
    
    else
      read -p 'Opção errada (PRESS ENTER TO CONTINUE...)' && continue
    fi

    elif [ $LAUNCH_GAME == '2' ] || [ $LAUNCH_GAME == '02' ]; then
      clear
      printf "Deseja executar com mangohud? [y/n]\n\n"
      read MANGOHUD2
      
      if [ $MANGOHUD2 == 'y' ] || [ $MANGOHUD2 == 'yes' ] || [ $MANGOHUD2 == 'Yes' ] || [ $MANGOHUD2 == 'YES' ] ; then
        printf "\nMANGOHUD ATIVO - Digite aqui o APP Name para executar um  jogo:\n\n"
        read EXECUTE
        mangohud --dlsym legendary launch $EXECUTE --offline --dry-run && clear
      
      elif [ $MANGOHUD2 == 'n' ] || [ $MANGOHUD2 == 'N' ] || [ $MANGOHUD2 == 'no' ] || [ $MANGOHUD2 == 'NO' ] ; then
        printf "\nMANGOHUD DESATIVADO - Digite aqui o APP Name para executar um jogo:\n\n"
        read EXECUTE
        legendary launch $EXECUTE --offline --dry-run && clear
      
      else
        read -p 'Opção errada (PRESS ENTER TO CONTINUE...)' && continue
      fi

    else
      read -p ' Opção errad (PRESS ENTER TO CONTINUE...)' && continue
    fi

  elif [ $EPIC_GAMES == '8' ] || [ $EPIC_GAMES == '08' ] ; then
    clear
    legendary list-installed --check-updates && echo && read -p " PRESS ENTER TO CONTINUE..."

  elif [ $EPIC_GAMES == '9' ] || [ $EPIC_GAMES == '09' ] ; then
    wine_install

  elif [ $EPIC_GAMES == '10' ] ; then
    clear &&  exit 0

  else
    clear 
    read -p "Opção inválida, por favor tente novamente (PRESS ENTER TO CONTINUE...)" && continue
fi
done
