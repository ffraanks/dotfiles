#!/usr/bin/env bash
clear
[ ! `command -v podman` ] && echo "podman não instalado, por favor faça a instalação" && exit 1

title(){
  clear
  cat << Podman
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
Podman
}


main(){
  clear
  title && printf "\n\nEscolha uma das opções abaixo:\n\n[1] - Proucurar por imagens\n[2] - Listar imagens\n[3] - Download imagem\n[4] - Remover containers\n[5] - Logs\n[6] - Executar imagem\n[7] - Gerenciar containers\n[8] - Sair\n\n"
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
    PodmanManager

  elif [ $OPTION_CHOICE == '8' ] || [ $OPTION_CHOICE == '08' ] ; then
    quitPodman

  else
    clear && read -p 'Opção inexistente!!! PRESSIONE ENTER PARA CONTINUAR...' && main
  fi
}

images_search(){
  clear
  printf "https://hub.docker.com/search?image_filter=official&q=&type=image"
  printf "\n\n" && read -p 'PRESSIONE ENTER PARA CONTINUAR...' && main

  #printf "Deseja ter somente a imagem oficial? [y/n]:\n\n"
  #read IMG_OFC
  #if [ $IMG_OFC == 'y' ] || [ $IMG_OFC == 'Y' ] || [ $IMG_OFC == 'yes' ] || [ $IMG_OFC == 'YES' ] || [ $IMG_OFC == 'Yes' ] ; then
    #clear
    #printf "Digite o nome da imagem (letra minuscula):\n\n"
    #read IMAGE_SEARCH
    #podman search "$IMAGE_SEARCH" --filter=is-official
    #printf "\n\n" && read -p 'PRESSIONE ENTER PARA CONTINUAR...' && main

  #elif [ $IMG_OFC == 'n' ] || [ $IMG_OFC == 'N' ] || [ $IMG_OFC == 'no' ] || [ $IMG_OFC == 'NO' ] || [ $IMG_OFC == 'No' ] ; then
    #clear
    #printf "Digite o nome da imagem (letra minuscula):\n\n"
    #read IMAGE_SEARCH
    #podman search "$IMAGE_SEARCH"

  #else
    #read -p 'Opção inexistente!!! PRESSIONE ENTER PARA CONTINUAR...' && main
  #fi
}

image_list(){
  clear
  podman ps -a
  printf "\n\n" && read -p 'PRESSIONE ENTER PARA CONTINUAR...' && main
}

image_down(){
  clear
  printf "Cole o nome da imagem abaixo:\n\n"
  read IMAGE_NAME
  printf "\n\nDigite o número da porta (ex: 8080:80):\n\n"
  read PORT_NUMBER
  podman run -dt -p "$PORT_NUMBER" "$IMAGE_NAME"
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
    podman rm -f "$CONTAINER_ID"
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
  clear
  printf "Escolha qual SHELL deseja usar:\n\n[1] - sh\n[2] - bash\n[3] - zsh\n\n"
  read CHOICE_SHELL
  if [ $CHOICE_SHELL == '1' ] || [ $CHOICE_SHELL == '01' ] ; then
    clear
    podman exec -ti "$IMAGE_RUN" sh
    printf "\n\n" && read -p 'PRESSIONE ENTER PARA CONTINUAR...' && main

  elif [ $CHOICE_SHELL == '2' ] || [ $CHOICE_SHELL == '02' ] ; then
    clear
    podman exec -ti "$IMAGE_RUN" bash
    printf "\n\n" && read -p 'PRESSIONE ENTER PARA CONTINUAR...' && main

  elif [ $CHOICE_SHELL == '3' ] || [ $CHOICE_SHELL == '03' ] ; then
    clear
    podman exec -ti "$IMAGE_RUN" zsh
    printf "\n\n" && read -p 'PRESSIONE ENTER PARA CONTINUAR...' && main

  else
    clear
    read -p 'Opção inexistente!!! PRESSIONE ENTER PARA CONTINUAR...' && main
  fi
}

PodmanManager(){
  clear
  printf "Escolha uma das opções abaixo:\n\n[1] - Start\n[2] - Stop\n\n"
  read MANAGER_PODMAN

  if [ $MANAGER_PODMAN == '1' ] || [ $MANAGER_PODMAN == '01' ] ; then
    clear
    printf "Deseja usar o start em todos os containers? [y/n]\n\n"
    read SELECT_PODMAN
    
    if [ $SELECT_PODMAN == 'y' ] || [ $SELECT_PODMAN == 'Y' ] || [ $SELECT_PODMAN == 'yes' ] || [ $SELECT_PODMAN == 'YES' ] || [ $SELECT_PODMAN == 'Yes' ] ; then
      clear
      podman start --all
      printf "\n\n" && read -p 'PRESSIONE ENTER PARA CONTINUAR...' && main

    elif [ $SELECT_PODMAN == 'n' ] || [ $SELECT_PODMAN == 'N' ] || [ $SELECT_PODMAN == 'no' ] || [ $SELECT_PODMAN == 'NO' ] || [ $SELECT_PODMAN == 'No' ] ; then
      clear
      printf "Cole aqui a ID do container que deseja usar o start:\n\n"
      read PODMAN_START
      podman start "$PODMAN_START"
      printf "\n\n" && read -p 'PRESSIONE ENTER PARA CONTINUAR...' && main
    fi

  elif [ $MANAGER_PODMAN == '2' ] || [ $MANAGER_PODMAN == '02' ] ; then
    clear
    printf "Deseja usar o stop em todos os containers? [y/n]\n\n"
    read SELECT_PODMAN1
    
    if [ $SELECT_PODMAN1 == 'y' ] || [ $SELECT_PODMAN1 == 'Y' ] || [ $SELECT_PODMAN1 == 'yes' ] || [ $SELECT_PODMAN1 == 'YES' ] || [ $SELECT_PODMAN1 == 'Yes' ] ; then
      clear
      podman stop -a
      printf "\n\n" && read -p 'PRESSIONE ENTER PARA CONTINUAR...' && main
      
    elif [ $SELECT_PODMAN1 == 'n' ] || [ $SELECT_PODMAN1 == 'N' ] || [ $SELECT_PODMAN1 == 'no' ] || [ $SELECT_PODMAN1 == 'NO' ] || [ $SELECT_PODMAN1 == 'No' ] ; then
      clear
      printf "Cole aqui a ID do container que deseja usar o stop:\n\n"
      read PODMAN_STOP
      podman stop "$PODMAN_STOP"
      printf "\n\n" && read -p 'PRESSIONE ENTER PARA CONTINUAR...' && main
    
    else
      clear && read -p 'Opção inexistente!!! PRESSIONE ENTER PARA CONTINUAR...' && main
    fi
  
  else
    clear && read -p 'Opção inexistente!!! PRESSIONE ENTER PARA CONTINUAR...' && main
  fi
}

quitPodman(){
  clear && exit 0
}
main
