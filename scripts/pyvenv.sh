#!/usr/bin/env bash

clear
mkdir $HOME/.PythonAmbienteVirtual
clear
printf "Para ativar o ambiente virutal: Entra no PATH na pasta bin e digite (source activate)\n"
printf "\nCriador de ambientes virtuais Python\n"
printf "\nEscolha uma opção abaixo:\n\n[1] - Criar ambiente virtual\n[2] - Remover ambientes\n[3] - Sair\n\n"
read CHOICE_OPTION
if [ $CHOICE_OPTION == '1' ] || [ $CHOICE_OPTION == '01' ] ; then
  clear
  cd $HOME/.PythonAmbienteVirtual
  printf "Digite o nome do seu ambimente (EVITE ESPAÇÕS E ACENTOS):\n\n"
  read AMBIMENTE_NOME
  python -m venv "$AMBIMENTE_NOME"

elif [ $CHOICE_OPTION == '2' ] || [ $CHOICE_OPTION == '02' ] ; then
  cd $HOME/.PythonAmbienteVirtual && ls
  printf "\nEscolha o ambiente virtual que deseja remover:\n\n"
  read DELETE_PASTE
  rm -rf "$DELETE_PASTE"

elif [ $CHOICE_OPTION == '3' ] || [ $CHOICE_OPTION == '03' ] ; then
  clear && exit 1

else
  clear && exit 1
fi
