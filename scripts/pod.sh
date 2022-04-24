#!/usr/bin/env bash
clear
[ ! `command -v podman` ] && echo "podman não instalado, por favor faça a instalação" && exit 1

main(){
  clear
  printf " 
 ██▓███   ▒█████  ▓█████▄  ███▄ ▄███▓ ▄▄▄       ███▄    █ 
▓██░  ██▒▒██▒  ██▒▒██▀ ██▌▓██▒▀█▀ ██▒▒████▄     ██ ▀█   █ 
▓██░ ██▓▒▒██░  ██▒░██   █▌▓██    ▓██░▒██  ▀█▄  ▓██  ▀█ ██▒
▒██▄█▓▒ ▒▒██   ██░░▓█▄   ▌▒██    ▒██ ░██▄▄▄▄██ ▓██▒  ▐▌██▒
▒██▒ ░  ░░ ████▓▒░░▒████▓ ▒██▒   ░██▒ ▓█   ▓██▒▒██░   ▓██░
▒▓▒░ ░  ░░ ▒░▒░▒░  ▒▒▓  ▒ ░ ▒░   ░  ░ ▒▒   ▓▒█░░ ▒░   ▒ ▒ 
░▒ ░       ░ ▒ ▒░  ░ ▒  ▒ ░  ░      ░  ▒   ▒▒ ░░ ░░   ░ ▒░
░░       ░ ░ ░ ▒   ░ ░  ░ ░      ░     ░   ▒      ░   ░ ░ 
             ░ ░     ░           ░         ░  ░         ░ 
                   ░                                      
\n\n"
 printf "Escolha uma das opções abaixo:\n\n[1] - Proucurar por imagens\n[2] - Listar imagens\n[3] - Baixar imagem\n[4] - Remover containers\n[5] - Logs\n[6] - Executar imagem\n[7] - Sair\n\n"
  read OPTION_CHOICE

  if [ $OPTION_CHOICE == '1' ] || [ $OPTION_CHOICE == '01' ] ; then
    images_search

  elif [ $OPTION_CHOICE == '2' ] || [ $OPTION_CHOICE == '02' ] ; then
    image_list

  elif [ $OPTION_CHOICE == '3' ] || [ $OPTION_CHOICE == '03' ] ; then
    image_down

  elif [ $OPTION_CHOICE == '4' ] || [ $OPTION_CHOICE == '04' ] ; then
    containers_del

  elif [ $OPTION_CHOICE == '5' ] || [ $OPTION_CHOICE == '05' ] ; then
    logsPodman

  elif [ $OPTION_CHOICE == '6' ] || [ $OPTION_CHOICE == '06' ] ; then
    image_run

  elif [ $OPTION_CHOICE == '7' ] || [ $OPTION_CHOICE == '07' ] ; then
    quitPodman

  else
    clear && read -p 'Opção inexistente!!! PRESSIONE ENTER PARA CONTINUAR...' && main
  fi
}

images_search(){
  clear
  printf "Deseja ter somente a imagem oficial? [y/n]:\n\n"
  read IMG_OFC
  if [ $IMG_OFC == 'y' ] || [ $IMG_OFC == 'Y' ] || [ $IMG_OFC == 'yes' ] || [ $IMG_OFC == 'YES' ] || [ $IMG_OFC == 'Yes' ] ; then
    clear
    printf "Digite o nome da imagem (letra minuscula):\n\n"
    read IMAGE_SEARCH
    podman search "$IMAGE_SEARCH" --filter=is-official true
    printf "\n\n" && read -p 'PRESSIONE ENTER PARA CONTINUAR...' && main

  elif [ $IMG_OFC == 'n' ] || [ $IMG_OFC == 'N' ] || [ $IMG_OFC == 'no' ] || [ $IMG_OFC == 'NO' ] || [ $IMG_OFC == 'No' ] ; then
    clear
    printf "Digite o nome da imagem (letra minuscula):\n\n"
    read IMAGE_SEARCH
    podman search "$IMAGE_SEARCH"

  else
    read -p 'Opção inexistente!!! PRESSIONE ENTER PARA CONTINUAR...' && main
  fi

}

image_list(){
  clear
  podman ps
  printf "\n\n" && read -p 'PRESSIONE ENTER PARA CONTINUAR...' && main
}

image_down(){
  clear
  PORT="8080:80"
  printf "Cole o nome da imagem abaixo:\n\n"
  read IMAGE_NAME
  podman run -dt -p "$PORT" "$IMAGE_NAME"
  printf "\n\n" && read -p 'PRESSIONE ENTER PARA CONTINUAR...' && main
}

containers_del(){
  clear
  printf "Escolha uma das opções abaxio:\n\n[1] - Deseja apagar somente 1 container\n[2] - Deseja apagar tudo?\n\n"
  read CONTAINER_DEL
  if [ $CONTAINER_DEL == '1' ] || [ $CONTAINER_DEL == '01' ] ; then
    clear
    printf "Cole abaixo o ID do container que deseja apagar:\n\n"
    read CONTAINER_ID
    podman stop "$CONTAINER_ID"
    podman -rm -f "$CONTAINER_ID"
    printf "\n\n" && read -p 'PRESSIONE ENTER PARA CONTINUAR...' && main

  elif [ $CONTAINER_DEL == '2' ] || [ $CONTAINER_DEL == '02' ] ; then
    clear
    printf "Pressione 'y' para apagar tudo:\n\n"
    podman system reset
    printf "\n\n" && read -p 'PRESSIONE ENTER PARA CONTINUAR...' && main
  fi
}

logsPodman(){
  clear
  printf "Cole abaixo o ID do container que você deseja ver o log:\n\n"
  read LOG_ID
  podman logs -f "$LOG_ID"
  printf "\n\n" && read -p 'PRESSIONE ENTER PARA CONTINUAR...' && main
}

image_run(){
  clear
  printf "Cole abaixo o ID da imagem para executar no terminal:\n\n"
  read IMAGE_RUN
  podman exec -ti "$IMAGE_RUN" bash
  printf "\n\n" && read -p 'PRESSIONE ENTER PARA CONTINUAR...' && main
}

quitPodman(){
  clear && exit 0
}
main
