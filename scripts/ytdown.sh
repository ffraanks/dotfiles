#!/usr/bin/env bash

# Franklin Souza
# @FranklinTech

# Packages check
[ ! `command -v yt-dlp` ] && echo "yt-dlp não está instalado, por favor faça a instalação" && exit 1
[ ! `command -v fzf` ] && echo "fzf não está instalado, por favor faça a instalação" && exit 1
[ ! `command -v mpv` ] && echo "mpv não está instalado, por favor faça a instalação" && exit 1

# Functions VIDEOS and PLAYLIST
delVid(){
clear
IFS=$'\n'
mapfile -t array < <(find  ~/.VideosDownload -regextype posix-egrep -regex '.*\.(mp4|mkv|webm)' | \
fzf-tmux --query="$1" --multi --select-1 --exit-0)
[[ -n "${array[@]}" ]] && rm -rf "${array[@]}"
}

playDel(){
clear
IFS=$'\n'
mapfile -t array < <(find  ~/.Playlist/"$PASTE_DELETE" -regextype posix-egrep -regex '.*\.(mp4|mkv|webm)' | \
fzf-tmux --query="$1" --multi --select-1 --exit-0)
[[ -n "${array[@]}" ]] && rm -rf "${array[@]}"
}

# Main Script
main(){
  while true ; do
    cd $HOME
    mkdir $HOME/.VideosDownload
    mkdir $HOME/.VideosDownload1
    clear
    SOUND=/usr/share/sounds/freedesktop/stereo/complete.oga
    printf "YOUTUBE DOWNLOADER\n\nEscolha uma das opções abaixo:\n\n[1] - Baixar vídeo do YouTube\n[2] - Assistir vídeo baixado\n[3] - Apagar video baixado\n[4] - Apagar playlist\n[5] - Baixar Playlist\n[6] - Sair\n\n"
    read OPTION

    if [ $OPTION == '1' ] || [ $OPTION == '01' ] ; then
      clear
      printf "Deseja criar uma pasta para o seu vídeo? [y/n] "
      read FOLDER_CREATE
      if [ $FOLDER_CREATE == 'y' ] || [ $FOLDER_CREATE == 'Y' ] || [ $FOLDER_CREATE == 'yes' ] || [ $FOLDER_CREATE == 'YES' ] || [ $FOLDER_CREATE == 'Yes' ] ; then
        clear && cd $HOME/.VideosDownload1
        printf "Digite o nome da pasta abaixo:\n\n"
        read FOLDER_NAME
        mkdir $HOME/.VideosDownload1/"$FOLDER_NAME"
        printf "\nCole seu link abaixo:\n\n"
        read LINK_VIDEO
        cd $HOME/.VideosDownload1/"$FOLDER_NAME" && yt-dlp -f bestvideo*+bestaudio/best "$LINK_VIDEO" && notify-send "YOUTUBE DOWNLOADER" "Vídeo baixado com sucesso!!!" && mpv $SOUND && continue

      elif [ $FOLDER_CREATE == 'n' ] || [ $FOLDER_CREATE == 'N' ] || [ $FOLDER_CREATE == 'no' ] || [ $FOLDER_CREATE == 'NO' ] || [ $FOLDER_CREATE == 'No' ] ; then
        clear && cd $HOME/.VideosDownload
        printf "Cole seu link abaixo:\n\n"
        read LINK_VIDEO
        yt-dlp -f bestvideo*+bestaudio/best "$LINK_VIDEO" && notify-send "YOUTUBE DOWNLOADER" "Vídeo baixado com sucesso!!!" && mpv $SOUND && continue

      else
        clear && read -p 'Opção inexistente... PRESSIONE ENTER PARA CONTINUAR...' && continue
      fi

    elif [ $OPTION == '2' ] || [ $OPTION == '02' ] ; then
      clear
      printf "Você deseja assistir vídeo único ou Playlist?\n\n[1] - Vídeo único\n[2] - Playlist\n[3] - Voltar\n\n"
      read PLAY
      
      if [ $PLAY == '1' ] || [ $PLAY == '01' ] ; then
        clear && printf "Deseja assistir video de alguma pasta? [y/n] "
        read VIDEO_FOLDER
        if [ $VIDEO_FOLDER == 'y' ] || [ $VIDEO_FOLDER == 'Y' ] || [ $VIDEO_FOLDER == 'Yes' ] || [ $VIDEO_FOLDER == 'yes' ] || [ $VIDEO_FOLDER == 'YES' ] ; then
          clear
          cd $HOME/.VideosDownload1 && ls
          printf "\nDigite o nome da pasta que deseja entrar:\n\n"
          read FOLDER_NAMEE
          cd $HOME/.VideosDownload/"$FOLDER_NAMEE"
          clear
          IFS=$'\n'
          mapfile -t array < <(find  ~/.VideosDownload1/"$FOLDER_NAMEE" -regextype posix-egrep -regex '.*\.(mp4|mkv|webm)' | \
            fzf-tmux --query="$1" --multi --select-1 --exit-0)
          [[ -n "${array[@]}" ]] && mpv "${array[@]}" && continue

        elif [ $VIDEO_FOLDER == 'n' ] || [ $VIDEO_FOLDER == 'N' ] || [ $VIDEO_FOLDER == 'No' ] || [ $VIDEO_FOLDER == 'no' ] || [ $VIDEO_FOLDER == 'NO' ] ; then
          cd $HOME/.VideosDownload
          clear
          IFS=$'\n'
          mapfile -t array < <(find  ~/.VideosDownload -regextype posix-egrep -regex '.*\.(mp4|mkv|webm)' | \
            fzf-tmux --query="$1" --multi --select-1 --exit-0)
          [[ -n "${array[@]}" ]] && mpv "${array[@]}" && continue
        fi

      elif [ $PLAY == '2' ] || [ $PLAY == '02' ] ; then
        clear
        printf "Deseja assistir Vídeo continuo (SEM PARAR) ou assistir um video de cada?\n\n[1] - Vídeo continuo\n[2] - Um vídeo por vez\n[3] - Voltar\n\n"
        read ESCOLHA
        if [ $ESCOLHA == '1' ] || [ $ESCOLHA == '01' ] ; then
          clear
          read -p 'EM DESENVOLVIMENTO....'
          #cd $HOME/.Playlist
          #ls
          #printf "\nEscolha a pasta que deseja ver a playlist: "
          #read PASTE_PLAYLIST
          #cd $HOME/.Playlist/"$PASTE_PLAYLIST" && mpv *

        elif [ $ESCOLHA == '2' ] || [ $ESCOLHA == '02' ] ; then
          clear
          cd $HOME/.Playlist
          ls
          printf "\nEscolha o nome da pasta que deseja entrar: "
          read PASTE_NAME_PLAYLIST
          cd $HOME/.Playlist/"$PASTE_NAME_PLAYLIST"
          clear
          IFS=$'\n'
          mapfile -t array < <(find  ~/.Playlist/"$PASTE_NAME_PLAYLIST" -regextype posix-egrep -regex '.*\.(mp4|mkv|webm)' | \
          fzf-tmux --query="$1" --multi --select-1 --exit-0)
          [[ -n "${array[@]}" ]] && mpv "${array[@]}" && continue

        elif [ $ESCOLHA == '3' ] || [ $ESCOLHA == '03' ] ; then
          clear && continue

        else
          read -p 'OPÇÃO INEXISTENTE... PRESSIONE ENTER PARA VOLTAR!!!' && continue
        fi

      elif [ $PLAY == '3' ] || [ $PLAY == '03' ] ; then
        continue

      else
        read -p 'OPÇÃO INEXISTENTE... PRESSIONE ENTER PARA SAIR!!!' && break && exit 1
      fi
     
    elif [ $OPTION == '3' ] || [ $OPTION == '03' ] ; then
      clear
      printf "Você deseja apagar um vídeo único ou apagar todos os vídeos baixados\n\n[1] - Vídeo único\n[2] - Todos os vídeos\n[3] - Voltar\n\n"
      read DELETE_VIDEO
      
      if [ $DELETE_VIDEO == '1' ] || [ $DELETE_VIDEO == '01' ] ; then
        delVid && continue

        elif [ $DELETE_VIDEO == '2' ] || [ $DELETE_VIDEO == '02' ] ; then
          clear
          rm -rf $HOME/.VideosDownload/*
          notify-send "YOUTUBE DOWNLOADER" "Vídeos apagados com sucesso!!!" && mpv $SOUND && continue

       elif [ $DELETE_VIDEO == '3' ] || [ $DELETE_VIDEO == '03' ] ; then
         clear && continue

       else
         read -p 'OPÇÃO INEXISTENTE... PRESSIONE ENTER PARA VOLTAR!!!' && continue
        fi
        
   elif [ $OPTION == '4' ] || [ $OPTION == '04' ] ; then
     clear
     printf "Você deseja apagar a playlist completa ou um único vídeo\n\n[1] - Playlist completa\n[2] - Um único vídeo\n[3] - Voltar\n\n"
     read DELETE_PLAYLIST

     if [ $DELETE_PLAYLIST == '1' ] || [ $DELETE_PLAYLIST == '01' ] ; then
       clear
       cd $HOME/.Playlist
       ls
       printf "\nEscolha a pasta que deseja apagar COMPLETAMENTE: "
       read PASTE_DELETE_ALL
       cd $HOME/.Playlist && rm -rf "$PASTE_DELETE_ALL"
       notify-send "YOUTUBE DOWNLOADER" "Playlist apagada com sucesso!!!" && mpv $SOUND && continue

     elif [ $DELETE_PLAYLIST == '2' ] || [ $DELETE_PLAYLIST == '02' ] ; then
       cd $HOME/.Playlist
       ls
       printf "\nEscolha a pasta que deseja apagar o vídeo único: "
       read PASTE_DELETE
       playDel && continue
     fi

     #read -p 'Videos apagados PRESSIONE ENTER PARA CONTINUAR...' && continue

   elif [ $OPTION == '5' ] || [ $OPTION == '05' ] ; then
     clear
     mkdir $HOME/.Playlist
     clear
     cd $HOME/.Playlist
     printf "Digite um nome da pasta para a sua playlist: "
     read PASTE_NAME
     mkdir "$PASTE_NAME"
     cd $HOME/.Playlist/"$PASTE_NAME"
     clear
     printf "Cole o link da playlist aqui: "
     read PLAYLISY_LINK
     #yt-dlp -f 'bv*+ba' "$PLAYLISY_LINK" -o '%(title)s.f%(format_id)s.%(ext)s' --no-playlist-reverse
     yt-dlp -f bestvideo*+bestaudio/best "$PLAYLISY_LINK" -o '%(title)s.f%(format_id)s.%(ext)s' --no-playlist-reverse
     notify-send "YOUTUBE DOWNLOADER" "Playlist baixada com sucesso!!!" && mpv $SOUND && continue

   elif [ $OPTION == '6' ] || [ $OPTION == '06' ] ; then
     clear && exit 0

   else
     echo && read -p 'OPÇÃO INEXISTENTE!!! PRESSIONE ENTER PARA CONTINUAR...' && continue
    fi
  done
}
main
