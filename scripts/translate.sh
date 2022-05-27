#!/usr/bin/env bash

while true ; do
  clear
  printf "
████████ ██████   █████  ██████  ██    ██ ████████  ██████  ██████  
   ██    ██   ██ ██   ██ ██   ██ ██    ██    ██    ██    ██ ██   ██ 
   ██    ██████  ███████ ██   ██ ██    ██    ██    ██    ██ ██████  
   ██    ██   ██ ██   ██ ██   ██ ██    ██    ██    ██    ██ ██   ██ 
   ██    ██   ██ ██   ██ ██████   ██████     ██     ██████  ██   ██ 
                                                                    
                                                                    \n\n"
  printf "O que você deseja fazer:\n\n[1] - Baixar o script de tradução\n[2] - Traduzir texto\n[3] - Sair do programa:\n\n"
  read ESCOLHA

  # Condicionais
  if [ $ESCOLHA == '1' ] || [ $ESCOLHA == '01' ] ; then
    clear
    printf "Desenvolvimento..."

  elif [ $ESCOLHA == '2' ] || [ $ESCOLHA == '02' ] ; then
    clear && printf "Cole abaixo o texto a ser traduzido:\n\n"
    read TEXT
    
    clear && read -p 'PRESSIONE ENTER PARA CONTINUAR...' && clear && printf "Traduzir: '$TEXT' para:\n\n[1] -> PT_BR\n[2] -> EN_US\n\n"
    read LANGUAGE_CHOICE

    if [ $LANGUAGE_CHOICE == '1' ] || [ $LANGUAGE_CHOICE == '01' ] ; then
      clear
      printf "Texto original: '$TEXT'\n\n"
      printf "Texto traduzido:\n\n"
      trans -b :pt "$TEXT" && printf "\n\n" && read -p 'PRESSIONE ENTER PARA CONTINUAR...' && continue

    elif [ $LANGUAGE_CHOICE == '2' ] || [ $LANGUAGE_CHOICE == '02' ] ; then
      clear
      printf "Texto original: '$TEXT'\n\n"
      printf "Texto traduzido:\n\n"
      trans -b :en "$TEXT" && printf "\n\n" && read -p 'PRESSIONE ENTER PARA CONTINUAR...' && continue
    
    else
      read -p 'Opção inexistente, por favor escolha a opção correta!!!' && continue
    fi

  elif [ $ESCOLHA == '3' ] || [ $ESCOLHA == '03' ] ; then
    clear && exit 0

  else
    read -p 'Opção inexistente, por favor escolha a opção correta!!!' && continue
  fi
done
