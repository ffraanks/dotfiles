#!/bin/env bash

# Script para criação de swapfile

# clear to screen
clear

# AVISO
printf "Executar esse script com sudo!!!\n\n"

# Filesystem
printf "Escolha seu filesystem\n" 
printf "[1] - EXT4\n"
printf "[2] - BTRFS\n"
printf "[3] - Remover swapfile\n\n"
printf "[4] - SAIR\n\n"
read MENU

# Condicionais do código
if [ $MENU == '1' ] || [ $MENU == '01' ] ; then
  clear
  printf "Digite o tamanho do seu swapfile (M = Megas - G = Gigas = Exemplo: 2G):\n\n"
  read TAM1
  fallocate -l $TAM1 /swapfile
  chmod 600 /swapfile
  mkswap /swapfile
  swapon /swapfile
  echo "/swapfile none swap defaults 0 0" >> /etc/fstab

elif [ $MENU == '2' ] || [ $MENU == '02' ] ; then
  clear
  truncate -s 0 /swapfile
  chattr +C /swapfile
  btrfs property set /swapfile compression none
  printf "Digite o tamanho do seu swapfile (M = Megas - G = Gigas = Exemplo: 2G):\n\n"
  read TAM2
  fallocate -l $TAM2 /swapfile
  chmod 600 /swapfile
  mkswap /swapfile
  swapon /swapfile
  echo "/swapfile none swap defaults 0 0" >> /etc/fstab

elif [ $MENU == '3' ] || [ $MENU == '03' ] ; then
  swapoff /swapfile
  rm -f /swapfile
  sed -i '/\/swapfile/d' /etc/fstab
  read -p 'Swapfile removido com sucesso PRESS ENTER TO CONTINUE...' && clear && exit 0

elif [ $MENU == '4' ] || [ $MENU == '04' ] ; then
  clear
  exit 0

else
  clear
  exit 0
fi
