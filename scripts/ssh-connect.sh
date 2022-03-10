#!/bin/env bash

clear
printf "Escolha uma das opções:\n\n[1] - Conectar SSH no celular\n[2] - Conectar SSH no computador:\n[3] - Sair\n\n"
read SSH_CHOICE

if [ $SSH_CHOICE == '1' ] || [ $SSH_CHOICE == '01' ] ; then
  clear
  printf "Digite o user que deseja se conectar:\n\n"
  read USER_SSH
  printf "\nAgora digite o ip que deseja se conectar:\n\n"
  read IP_SSH
  ssh -p 8022 $USER_SSH@$IP_SSH

elif [ $SSH_CHOICE == '2' ] || [ $SSH_CHOICE == '02' ] ; then
  clear
  printf "Digite o user que deseja se conectar:\n\n"
  read USER_SSH1
  printf "\nAgora digite o ip que deseja se conectar:\n\n"
  read IP_SSH1
  ssh -p 22 $USER_SSH1@IP_SSH1

elif [ $SSH_CHOICE == '3' ] || [ $SSH_CHOICE == '03' ] ; then
  clear && exit 0

else
  clear && exit 0
fi
