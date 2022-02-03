#!/bin/env bash

# Franklin Souza
# @FranklinTech
# QemuVM Script CLI
# Github: https://github.com/ffraanks/

downqemu(){
  while true ; do
    mkdir $HOME/.QemuVM

  clear
  printf "Deseja baixar o qemu?\n[1] - Sim\n[2] - Não\n[3] - Sair\n\n"
  read QEMUDOWN
  if [ $QEMUDOWN == '1' ] || [ $QEMUDOWN == '01' ] ; then
    clear && printf "Qual a distribuição?\n\n[1] -   (Arch Linux)\n[2] -   (Ubuntu)\n[3] -   (Fedora)\n\n[4] - Voltar\n\n"
    read DISTROCHOICE
    if [ $DISTROCHOICE == '1' ] || [ $DISTROCHOICE == '01' ] ; then
      sudo pacman -S qemu --noconfirm
      qemuCLI

    elif [ $DISTROCHOICE == '2' ] || [ $DISTROCHOICE == '02' ] ; then
      sudo apt update && sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils
      qemuCLI

    elif [ $DISTROCHOICE == '3' ] || [ $DISTROCHOICE == '03' ] ; then
      su -c "dnf install qemu"
      qemuCLI

    elif [ $DISTROCHOICE == '4' ] || [ $DISTROCHOICE == '04' ] ; then
      continue

    fi
  elif [ $QEMUDOWN == '2' ] || [ $QEMUDOWN == '02' ] ; then
    qemuCLI

  elif [ $QEMUDOWN == '3' ] || [ $QEMUDOWN == '03' ] ; then
    clear && exit 0

  else
    clear && read -p 'Opção inexistente (PRESS ENTER TO CONTINUE...)' && clear && exit 0 
  fi
done
}


qemuCLI(){

  while true ; do
    clear
    printf "
 ██████╗ ███████╗███╗   ███╗██╗   ██╗    ██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     
██╔═══██╗██╔════╝████╗ ████║██║   ██║    ██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     
██║   ██║█████╗  ██╔████╔██║██║   ██║    ██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     
██║▄▄ ██║██╔══╝  ██║╚██╔╝██║██║   ██║    ██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     
╚██████╔╝███████╗██║ ╚═╝ ██║╚██████╔╝    ██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗
 ╚══▀▀═╝ ╚══════╝╚═╝     ╚═╝ ╚═════╝     ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝
                                                                                               \n\n"
    printf "Escolha uma das oções baixo:\n\n[1] - Criar VM\n[2] - Remover VM\n[3] - Executar VM\n[4] - Baixar ISO\n[5] - Voltar\n[6] - Listar VMs\n[7] - Sair\n\n"
    read CHOICE_OPTION
    if [ $CHOICE_OPTION == '1' ] || [ $CHOICE_OPTION == '01' ] ; then
      clear
      cd $HOME/.QemuVM
      printf "Coloque um nome para seu HD (EVITE DE COLOCAR ESPAÇOS E TRAÇOS)\n\n"
      read HDNAME
      clear && printf "Defina o tamanho do seu HD (EX: 30G - Para 30 Gigas)\n\n"
      read HDSIZE
      qemu-img create -f qcow2 "$HDNAME.qcow2" "$HDSIZE"
      read -p 'Agora vamos configurar o qemu PRESS ENTER TO CONTINUE...' && clear
      printf "Defina o tamanho da memoria ram (EX: 2G - Para 2 Gigas)\n\n"
      read RAMSIZE
      clear && printf "Defina quantos nucleos quer para a sua VM (EX: 2 - Para 2 Nucleos)\n\n"
      read NUCLEOS
      clear && printf "Defina um nome para a sua VM (EX: Arch Linux)\n\n"
      read NAMEISO
      read -p 'Configuração finalizada, PRESS ENTER TO CONTINUE...' && clear
      printf "Escolha a .iso que queira executar (Recomendado: Copiar e colar o nome)\n\n" && ls *.iso
      printf "\n" && read ISONAME
      uefi_bios
    
    elif [ $CHOICE_OPTION == '2' ] || [ $CHOICE_OPTION == '02' ] ; then
      del

    elif [ $CHOICE_OPTION == '3' ] || [ $CHOICE_OPTION == '03' ] ; then
      clear
      cd $HOME/.QemuVM
      printf "Defina o nome para sua VM (EX: Arch Linux)\n\n"
      read NAMEISO1
      clear && printf "Copie e cole o nome do HD.qcow2\n\n" && ls *.qcow2
      printf "\n" && read HDNAME1
      clear && printf "Rodando qemu..." && qemu-system-x86_64 --enable-kvm -name '$NAMEISO1' -drive format=qcow2,file="$HDNAME1"

    elif [ $CHOICE_OPTION == '4' ] || [ $CHOICE_OPTION == '04' ] ; then
      clear
      cd $HOME/.QemuVM
      printf "Cole o download do link da iso:\n\n"
      printf "\n" && read DOWNLOADISO
      wget -c "$DOWNLOADISO" && read -p 'PRESS ENTER TO CONTINUE...' && continue

    elif [ $CHOICE_OPTION == '5' ] || [ $CHOICE_OPTION == '05' ] ; then
    downqemu

    elif [ $CHOICE_OPTION == '6' ] || [ $CHOICE_OPTION == '06' ] ; then
      cd $HOME/.QemuVM && ls *.qcow2
      read -p 'PRESS ENTER TO CONTINUE...' && continue

    elif [ $CHOICE_OPTION == '7' ] || [ $CHOICE_OPTION == '07' ] ; then
      clear && exit 0

    else
      clear && read -p 'Opção incorreta, PRESS ENTER TO CONTINUE...' && continue
    fi
  done
}
uefi_bios(){
  clear && printf "Deseja abrir a VM com UEFI ou BIOS?\n\n[1] (EM DESENVOLVIMENTO NAO CLIQUE) - UEFI\n[2] - BIOS\n\n"
read UEFI_BIOS

if [ $UEFI_BIOS == '1' ] || [ $UEFI_BIOS == '01' ] ; then
   printf "Em desenvolvimento...\n"
   read -p 'PRESS ENTER TO CONTINUE...' && qemuCLI
   #cd $HOME/.QemuVM && clear && printf "Rodando qemu..." && qemu-system-x86_64 --enable-kvm -m "$RAMSIZE" -smp "$NUCLEOS" -name '$NAMEISO' -bios /usr/share/ovmf/OVMF.fd -hda "$HDNAME.qcow2" -cdrom "$ISONAME"
   #cd $HOME/.QemuVM && clear && printf "Rodando qemu..." && qemu-system-x86_64 --enable-kvm -m "$RAMSIZE" -smp "$NUCLEOS" -name '$NAMEISO' -boot uefi -hda "$HDNAME.qcow2" -cdrom "$ISONAME"

elif [ $UEFI_BIOS == '2' ] || [ $UEFI_BIOS == '02' ] ; then
   cd $HOME/.QemuVM && clear && printf "Rodando qemu..." && qemu-system-x86_64 --enable-kvm -m "$RAMSIZE" -smp "$NUCLEOS" -name '$NAMEISO' -boot d -hda "$HDNAME.qcow2" -cdrom "$ISONAME"

else
  printf "Opção inexistente (PRESS ENTER TO CONTINUE...)"
  qemuCLI
fi
}

del(){
cd $HOME/.QemuVM
clear && printf "Qual você deseja apagar\n[1] - ISO\n[2] - HD \n(Recomendado: COPIAR E COLAR O NOME)\n\n"
read DEL

if [ $DEL == '1' ] || [ $DEL == '01' ] ; then
  ls *.iso
  printf "\n" && read DELETEISO
  rm -rf "$DELETEISO"

elif [ $DEL == '2' ] || [ $DEL == '02' ] ; then
  ls *.qcow2
  printf "\n" && read DELHD
  rm -rf "$DELHD"
      
else
  read -p 'Opção inexistente (PRESS ENTER TO CONTINUE...)' && qemuCLI
fi
}

downqemu
