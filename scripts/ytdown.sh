#!/bin/env bash

# Franklin Souza
# @FranklinTech

# Packages
[ ! `command -v yt-dlp` ] && echo "yt-dlp não está instalado, por favor faça a instalação" && exit 1
[ ! `command -v fzf` ] && echo "fzf não está instalado, por favor faça a instalação" && exit 1

main(){
  while true ; do
    mkdir $HOME/.VideosDownload
    clear
    SOUND=/usr/share/sounds/freedesktop/stereo/complete.oga
    printf "YOUTUBE DOWNLOADER\n\nEscolha uma das opções abaixo:\n\n[1] - Baixar vídeo do YouTube\n[2] - Assistir vídeo baixado\n[3] - Apagar video baixado\n[4] - Sair\n\n"
    read OPTION

    if [ $OPTION == '1' ] || [ $OPTION == '01' ] ; then
      clear && cd $HOME/.VideosDownload
      printf "Cole seu link abaixo:\n\n"
      read LINK_VIDEO
      yt-dlp "$LINK_VIDEO" && notify-send "YOUTUBE DOWNLOADER" "Vídeo baixado com sucesso!!!" && mpv $SOUND && continue

    elif [ $OPTION == '2' ] || [ $OPTION == '02' ] ; then
      clear
      IFS=$'\n'
      mapfile -t array < <(find  ~/.VideosDownload -regextype posix-egrep -regex '.*\.(mp4|mkv|webm)' | \
      fzf-tmux --query="$1" --multi --select-1 --exit-0)
      [[ -n "${array[@]}" ]] && mpv "${array[@]}" && continue
     
    elif [ $OPTION == '3' ] || [ $OPTION == '03' ] ; then

      clear
      printf "Deseja apagar um video?(y/n)\n\n"
      read DELETE
      if [ $DELETE == 'y' ] || [ $DELETE == 'Y' ] || [ $DELETE == 'Yes' ] || [ $DELETE == 'YES' ] || [ $DELETE == 'yes' ] ; then

        clear
        IFS=$'\n'
        mapfile -t array < <(find  ~/.VideosDownload -regextype posix-egrep -regex '.*\.(mp4|mkv|webm)' | \
        fzf-tmux --query="$1" --multi --select-1 --exit-0)
        [[ -n "${array[@]}" ]] && rm -rf "${array[@]}" && continue

        elif [ $DELETE == 'n' ] || [ $DELETE == 'N' ] || [ $DELETE == 'No' ] || [ $DELETE == 'NO' ] || [ $DELETE == 'no' ] ; then
         clear && continue

         fi

   elif [ $OPTION == '4' ] || [ $OPTION == '03' ] ; then
     clear && exit 0

   else
     echo && read -p 'OPÇÃO INEXISTENTE!!! PRESSIONE ENTER PARA SAIR...' && clear && exit 1
    fi
  done
}
main
