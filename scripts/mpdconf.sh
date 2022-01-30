#!/bin/env bash

main(){
  clear
  printf "
███╗   ███╗██████╗ ██████╗     ██╗███╗   ██╗ ██████╗███╗   ███╗██████╗  ██████╗██████╗ ██████╗ 
████╗ ████║██╔══██╗██╔══██╗   ██╔╝████╗  ██║██╔════╝████╗ ████║██╔══██╗██╔════╝██╔══██╗██╔══██╗
██╔████╔██║██████╔╝██║  ██║  ██╔╝ ██╔██╗ ██║██║     ██╔████╔██║██████╔╝██║     ██████╔╝██████╔╝
██║╚██╔╝██║██╔═══╝ ██║  ██║ ██╔╝  ██║╚██╗██║██║     ██║╚██╔╝██║██╔═══╝ ██║     ██╔═══╝ ██╔═══╝ 
██║ ╚═╝ ██║██║     ██████╔╝██╔╝   ██║ ╚████║╚██████╗██║ ╚═╝ ██║██║     ╚██████╗██║     ██║     
╚═╝     ╚═╝╚═╝     ╚═════╝ ╚═╝    ╚═╝  ╚═══╝ ╚═════╝╚═╝     ╚═╝╚═╝      ╚═════╝╚═╝     ╚═╝     
                                                                                               \n\n"

printf "Deseja instalar MPD, MPC e NCMPCPP?\n\n[1] - Sim\n[2] - Não, eu já tenho\n[3] - Sair\n\n"
read INSTALL_PACKAGES
if [ $INSTALL_PACKAGES == '1' ] || [ $INSTALL_PACKAGES == '01' ] ; then
  clear
  printf "De permissão sudo para baixar (Arch Linux Based)\n\n"
  sudo pacman -S mpd ncmpcpp mpc --noconfirm
  clear
  read -p 'PRESSIONE ENTER PARA CONTINUAR...' && options

elif [ $INSTALL_PACKAGES == '2' ] || [ $INSTALL_PACKAGES == '02' ] ; then
  clear
  read -p 'PRESSIONE ENTER PARA CONTINUAR...' && options

elif [ $INSTALL_PACKAGES == '3' ] || [ $INSTALL_PACKAGES == '03' ] ; then
  clear && exit 0
else
  clear && read -p 'Opção invalida TENTE NOVAMENTE...' && main
fi
}

options(){
  clear
  printf "RECOMENDADO importar as duas configurações, mas você pode importar qual você desejar:\n\n[1] - Importar config MPD\n[2] - Importar config NCMPCPP\n[3] - Abrir Music\n[4] - Sair\n\n"
  read CONFIG_IMPORT
  
  if [ $CONFIG_IMPORT == '1' ] || [ $CONFIG_IMPORT == '01' ] ; then
    clear && cat << EOF
Essa é a minha config do MPD, mas esse script permite você alterar algumas coisas!
LEMBRE-SE se você já tiver as configs vai ser tudo apagado e adicionado a minha
FAÇAM BACKUPS!!!

EOF
    printf "\n\nO path de musica está em: $HOME/Music você pode alterar depois de fazer o script a config fica em: $HOME/.mpd/mpd.conf\n\n"
    read -p 'PRESSIONE ENTER PARA CONTINUAR...'
    rm -rf ~/.mpd
    mkdir -p ~/.mpd/playlists
    touch ~/.mpd/{mpd.conf,mpd.db,mpd.log,mpd.pid,mpdstate}
    clear
    printf "Copie e cole seu user, SEU USER É: $USER\n\n"
    read "USER_NAME"
    A=$(echo "\"")
    clear
    echo 'music_directory        "/home/'$USER_NAME'/Music"' >> ~/.mpd/mpd.conf
    echo 'playlist_directory     "/home/'$USER_NAME'/.mpd/playlists"' >> ~/.mpd/mpd.conf
    echo 'db_file            "/home/'$USER_NAME'/.mpd/tag_cache"' >> ~/.mpd/mpd.conf
    echo 'log_file        "/home/'$USER_NAME'/.mpd/mpd.log"' >> ~/.mpd/mpd.conf
    echo 'pid_file        "/home/'$USER_NAME'/.mpd/mpd.pid"' >> ~/.mpd/mpd.conf
    echo 'state_file        "/home/'$USER_NAME'/.mpd/mpdstate"' >> ~/.mpd/mpd.conf
    echo 'bind_to_address   "/home/'$USER_NAME'/.mpd/socket"' >> ~/.mpd/mpd.conf
    echo 'audio_output {
  type    "pulse"
  name    "MPD"                                                              
# server    "remote_server"   # optional
# sink    "remote_server_sink"  # optional
}' >> ~/.mpd/mpd.conf
    echo 'audio_output {
    type                    "fifo"
    name                    "my_fifo"
    path                    "/tmp/mpd.fifo"
    format                  "44100:16:1"
    }' >> ~/.mpd/mpd.conf
    echo 'bind_to_address "localhost"
port  "6600"
user' $A$USER_NAME$A >> ~/.mpd/mpd.conf
    echo 'auto_update    "yes"' >> ~/.mpd/mpd.conf
    echo 'mixer_type     "software"' >> ~/.mpd/mpd.conf
    echo 'replaygain     "track"' >> ~/.mpd/mpd.conf
    echo 'gapless_mp3_playback    "yes"' >> ~/.mpd/mpd.conf
    options

  elif [ $CONFIG_IMPORT == '2' ] || [ $CONFIG_IMPORT == '02' ] ; then
    clear
    cat << EOF
Para baixar a minha configo do NCMPCPP você vai precisar do wget (vai baixar diretamente do meu github)
de as permissão sudo para poder baixar o wget (Você pode apagar depois se quiser) se você já tiver o wget pode passar!!!
EOF

    printf "Deseja baixar o wget? (Arch Linux or based)\n\n[1] - Sim\n[2] - Não\n\n"
    read WGET_INSTALL
    
    if [ $WGET_INSTALL == '1' ] || [ $WGET_INSTALL == '01' ] ; then
      sudo pacman -S wget --noconfirm
      rm -rf $HOME/.config/ncmpcpp
      mkdir $HOME/.config/ncmpcpp
      clear && cd $HOME/.config/ncmpcpp && wget -c "https://github.com/ffraanks/dotfiles/raw/master/.config/ncmpcpp/config" && clear && options

    elif [ $WGET_INSTALL == '2' ] || [ $WGET_INSTALL == '02' ] ; then
      rm -rf $HOME/.config/ncmpcpp
      mkdir $HOME/.config/ncmpcpp
      clear && cd $HOME/.config/ncmpcpp && wget -c "https://github.com/ffraanks/dotfiles/raw/master/.config/ncmpcpp/config" && clear && options

    else
      options
    fi

  elif [ $CONFIG_IMPORT == '3' ] || [ $CONFIG_IMPORT == '03' ] ; then
    clear
    #killall mpd && clear
    mpd && ncmpcpp

  elif [ $CONFIG_IMPORT == '4' ] || [ $CONFIG_IMPORT == '04' ] ; then
    clear && exit 0

  else
    clear && read -p 'Opção invalida, TENTE NOVAMENTE...' && options
  fi
}
main
