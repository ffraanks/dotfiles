#!/usr/bin/env bash

# Limpando a tela e checando pacotes
clear
[ ! `command -v heimdall` ] && echo "heimdall não instalado, por favor faça a instalação" && exit 1
[ ! `command -v unzip` ] && echo "unzip não instalado, por favor faça a instalação" && exit 1
[ ! `command -v 7z` ] && echo "p7zip não instalado, por favor faça a instalação" && exit 1
[ ! `command -v unlz4` ] && echo "unlz4 não instalado, por favor faça a instalação" && exit 1
[ ! `command -v wget` ] && echo "wget não instalado, por favor faça a instalação" && exit 1
[ ! `command -v python3` ] && echo "python3 não instalado, por favor faça a instalação" && exit 1

while true ; do

# Titulo e menu
  clear
  printf "
██╗  ██╗███████╗██╗███╗   ███╗██████╗  █████╗ ██╗     ██╗     
██║  ██║██╔════╝██║████╗ ████║██╔══██╗██╔══██╗██║     ██║     
███████║█████╗  ██║██╔████╔██║██║  ██║███████║██║     ██║     
██╔══██║██╔══╝  ██║██║╚██╔╝██║██║  ██║██╔══██║██║     ██║     
██║  ██║███████╗██║██║ ╚═╝ ██║██████╔╝██║  ██║███████╗███████╗
╚═╝  ╚═╝╚══════╝╚═╝╚═╝     ╚═╝╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝
                                                              \n\nEscolha uma das opções abaixo:\n\n[1] - Instalar Recovery\n[2] - StockROM\n[3] - Sair\n\n"
  read OPTION

  # Condições do menu
  if [ $OPTION == '1' ] || [ $OPTION == '01' ] ; then
    clear
    printf "Coloque o caminho onde está sua imagem recovery (ex: /home/user/Android/boot.img) LEMBRE-SE DE ESTÁ COM O CELULAR PLUGADO NO COMPUTADOR EM MODO DOWNLOAD:\n\n"
    read RECOVERY_PATH
    heimdall flash --RECOVERY "$RECOVERY_PATH" && continue

  elif [ $OPTION == '2' ] || [ $OPTION == '02' ] ; then
    mkdir $HOME/.StockROM
    clear
    printf "Digite um nome para a sua pasta da ROM:\n\n"
    read FOLDER_NAME
    mkdir $HOME/.StockROM/"$FOLDER_NAME"
    clear && printf "Agora digite o caminho onde se encontra sua ROM.zip (Ex: /home/user/Downloads)\n\n"
    read ROM_PATH
    cd "$ROM_PATH" && ls -1
    printf "\nCopie e cole abaixo o nome da rom para extrai-la:\n\n"
    read ROM_EXTRACT
    cp -r "$ROM_EXTRACT" $HOME/.StockROM/"$FOLDER_NAME"
    cd $HOME/.StockROM/"$FOLDER_NAME"
    unzip "$ROM_EXTRACT" && rm -rf *.zip
    cd $HOME/.StockROM/"$FOLDER_NAME" && rm -rf _\ stockrom.net\ +\ Firmwares.url STOCKROM.NET\ -\ Instalacao\ -\ Leia\ Antes
    clear && printf "Digite um nome da pasta para extrair os arquivos:\n\n"
    read EXTRACT_FILES
    mkdir $HOME/.StockROM/"$FOLDER_NAME"/"$EXTRACT_FILES"
    printf "Você deseja uma ROM lima ou com a HOME preservada?\n\n[1] - Limpa (Recomendado)\n[2] - Preservada:\n\n"
    read CHOICE_OPTION
    if [ $CHOICE_OPTION == '1' ] || [ $CHOICE_OPTION == '01' ] ; then
      clear
      cd $HOME/.StockROM/"$FOLDER_NAME" && rm -rf HOME_CSC_ZTO_G610MZTO8CTG1_CL16390851_QB32881712_REV00_user_low_ship.tar.md5
      #cd $HOME/.StockROM/"$FOLDER_NAME"/"$EXTRACT_FILES" && 7z X *.tar.md5 && rm -rf *.tar.md5
      cd $HOME/.StockROM/"$FOLDER_NAME"
      7z X AP_G610MUBS8CTG1_CL14381225_QB32851602_REV00_user_low_ship_meta.tar.md5 && clear
      7z X BL_G610MUBS8CTG1_CL14381225_QB32851602_REV00_user_low_ship.tar.md5 && clear
      7z X CP_G610MUBS8CTG1_CP16298432_CL14381225_QB32851602_REV00_user_low_ship.tar.md5 && clear
      7z X CSC_ZTO_G610MZTO8CTG1_CL16390851_QB32881712_REV00_user_low_ship.tar.md5 && clear
      mv *.lz4 $HOME/.StockROM/"$FOLDER_NAME"/"$EXTRACT_FILES"
      cd $HOME/.StockROM/"$FOLDER_NAME"/"$EXTRACT_FILES" && unlz4 -m * && rm -rf *.lz4
      cd $HOME/"$FOLDER_NAME" && mv modem.bin $HOME/.StockROM/"$FOLDER_NAME"/"$EXTRACT_FILES"
      clear && printf "Deseja flashear a StockROM agora? [y/n]\n\n"
      read FLASH_ROM

      if [ $FLASH_ROM == 'y' ] || [ $FLASH_ROM == 'Y' ] || [ $FLASH_ROM == 'yes' ] || [ $FLASH_ROM == 'Yes' ] || [ $FLASH_ROM == 'YES' ] ; then
        cd $HOME/.StockROM/"$FOLDER_NAME"/"$EXTRACT_FILES" && wget -c "https://github.com/VegaBobo/gen_stock_flash_command_heimdall/raw/main/gen_flash_command_heimdall.py"
        clear && read -p 'PLUGA SEU DEVICE ANTES DE CONTINUAR...(PRESSIONE ENTER SE O DEVICE ESTIVER PLUGADO EM MODO DOWNLOAD)' && heimdall print-pit > pit.txt --no-reboot
        clear && ls && exit 0

      elif [ $FLASH_ROM == 'n' ] || [ $FLASH_ROM == 'N' ] || [ $FLASH_ROM == 'no' ] || [ $FLASH_ROM == 'No' ] || [ $FLASH_ROM == 'NO' ] ; then
        read -p "Operação cancelada, PRESSIONE ENTER PARA SAIR..." && clear && exit 0

      else
        clear && exit 0
      fi

    elif [ $CHOICE_OPTION == '2' ] || [ $CHOICE_OPTION == '02' ] ; then
      clear
      cd $HOME/.StockROM/"$FOLDER_NAME" && rm -rf CSC_ZTO_G610MZTO8CTG1_CL16390851_QB32881712_REV00_user_low_ship.tar.md5
      #cd $HOME/.StockROM/"$FOLDER_NAME"/"$EXTRACT_FILES" && 7z X *.tar.md5 && rm -rf *.tar.md5
      cd $HOME/.StockROM/"$FOLDER_NAME"
      7z X AP_G610MUBS8CTG1_CL14381225_QB32851602_REV00_user_low_ship_meta.tar.md5 && clear
      7z X BL_G610MUBS8CTG1_CL14381225_QB32851602_REV00_user_low_ship.tar.md5 && clear
      7z X CP_G610MUBS8CTG1_CP16298432_CL14381225_QB32851602_REV00_user_low_ship.tar.md5 && clear
      7z X HOME_CSC_ZTO_G610MZTO8CTG1_CL16390851_QB32881712_REV00_user_low_ship && clear
      mv *.lz4 $HOME/.StockROM/"$FOLDER_NAME"/"$EXTRACT_FILES"
      cd $HOME/.StockROM/"$FOLDER_NAME"/"$EXTRACT_FILES" && unlz4 -m * && rm -rf *.lz4
      cd $HOME/"$FOLDER_NAME" && mv modem.bin $HOME/.StockROM/"$FOLDER_NAME"/"$EXTRACT_FILES"
      clear && printf "Deseja flashear a StockROM agora? [y/n]\n\n"
      read FLASH_ROM1

      if [ $FLASH_ROM1 == 'y' ] || [ $FLASH_ROM1 == 'Y' ] || [ $FLASH_ROM1 == 'yes' ] || [ $FLASH_ROM1 == 'Yes' ] || [ $FLASH_ROM1 == 'YES' ] ; then
        cd $HOME/.StockROM/"$FOLDER_NAME"/"$EXTRACT_FILES" && wget -c "https://github.com/VegaBobo/gen_stock_flash_command_heimdall/raw/main/gen_flash_command_heimdall.py"
        clear && read -p 'PLUGA SEU DEVICE ANTES DE CONTINUAR...(PRESSIONE ENTER SE O DEVICE ESTIVER PLUGADO EM MODO DOWNLOAD)' && heimdall print-pit > pit.txt --no-reboot
        clear && ls && exit 0

      elif [ $FLASH_ROM1 == 'n' ] || [ $FLASH_ROM1 == 'N' ] || [ $FLASH_ROM1 == 'no' ] || [ $FLASH_ROM1 == 'No' ] || [ $FLASH_ROM1 == 'NO' ] ; then
        read -p "Operação cancelada, PRESSIONE ENTER PARA SAIR..." && clear && exit 0

      else
        clear && exit 0
      fi
    fi
 
  elif [ $OPTION == '3' ] || [ $OPTION == '03' ] ; then
    clear && exit 0
  fi
done
