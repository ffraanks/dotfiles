#!/bin/env bash

# Franklin Souza
# @FranklinTech
# QemuVM Script CLI
# Github: https://github.com/ffraanks/

init(){
  mkdir $HOME/.QemuVM
  while true ; do
    clear
    printf "Deseja baixar e instalar o qemu?\n\n[1] - Sim\n[2] - Não\n[3] - Sair\n\n"
    read QEMU_INSTALL
    
    if [ $QEMU_INSTALL == '1' ] || [ $QEMU_INSTALL == '01' ] ; then
      clear
      printf "De permissão sudo para poder baixar o qemu (Arch Linux ou Arch Linux based):\n\n"
      sudo pacman -S qemu --noconfirm && qemuCLI
    
    elif [ $QEMU_INSTALL == '2' ] || [ $QEMU_INSTALL == '02' ] ; then
      clear && qemuCLI
    
    elif [ $QEMU_INSTALL == '3' ] || [ $QEMU_INSTALL == '03' ] ; then
      clear && exit 0
    
    else
      read -p 'Opção incorreta (PRESS ENTER TO CONTINUE...)'
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
    printf "Escolha uma das oções baixo:\n\n[1] - Criar VM\n[2] - Remover VM\n[3] - Executar VM\n[4] - Baixar ISO\n[5] - Sair\n\n"
    read CHOICE_OPTION
    if [ $CHOICE_OPTION == '1' ] || [ $CHOICE_OPTION == '01' ] ; then
      clear
      cd $HOME/.QemuVM
      printf "Coloque um nome para seu HD (EVITE DE COLOCAR ESPAÇOS E TRAÇOS)\n\n"
      read HDNAME
      printf "\n\nDefina o tamanho do seu HD (EX: 30G - Para 30 Gigas)\n\n"
      read HDSIZE
      qemu-img create -f qcow2 "$HDNAME.qcow2" "$HDSIZE"
      read -p 'Agora vamos configurar o qemu PRESS ENTER TO CONTINUE...' && clear
      printf "Defina o tamanho da memoria ram (EX: 2G - Para 2 Gigas)\n\n"
      read RAMSIZE
      printf "\n\nDefina quantos nucleos quer para a sua VM (EX: 2 - Para 2 Nucleos)\n\n"
      read NUCLEOS
      printf "\n\nDefina um nome para a sua VM (EX: Arch Linux)\n\n"
      read NAMEISO
      read -p 'Configuração finalizada, aguarde...' && clear
      printf "Escolha a .iso que queira executar (Recomendado: Copiar e colar o nome)\n\n" && ls
      read ISONAME
      uefi_bios
      #cd $HOME/.QemuVM && clear && printf "Rodando qemu..." && qemu-system-x86_64 --enable-kvm -m "$RAMSIZE" -smp "$NUCLEOS" -name '$NAMEISO' -boot d -hda "$HDNAME.qcow2" -cdrom "$ISONAME"
      
    
     elif [ $CHOICE_OPTION == '2' ] || [ $CHOICE_OPTION == '02' ] ; then
      printf "Qual você deseja apagar (Recomendado: COPIAR E COLAR O NOME)\n\n"
      cd $HOME/.QemuVM && ls
      read DELETEISO
      rm -rf "$DELETEISO"

    elif [ $CHOICE_OPTION == '3' ] || [ $CHOICE_OPTION == '03' ] ; then
      clear
      cd $HOME/.QemuVM
      ls
      #printf "\n\nDefina o tamanho da sua Memoria RAM (EX: 2G - Para 2 Gigas)\n\n"
      #read RAMSIZE1
      #printf "\n\nDefina quantos nucleos sua VM vai usar (EX: 2 - Para 2 Nucleos)\n\n"
      #read NUCLEOS1
      printf "\n\nDefina o nome para sua VM (EX: Arch Linux)\n\n"
      read NAMEISO1
      #printf "\n\nCopia e cole o arquivo .iso\n\n"
      #read ISONAME1
      printf "\n\nCopie e cole o nome do HD.qcow2\n\n"
      read HDNAME1
      clear && printf "Rodando qemu..." && qemu-system-x86_64 --enable-kvm -name '$NAMEISO1' -drive format=qcow2,file="$HDNAME1"

    elif [ $CHOICE_OPTION == '4' ] || [ $CHOICE_OPTION == '04' ] ; then
      clear
      cd $HOME/.QemuVM
      printf "Cole o download do link da iso:\n\n"
      read DOWNLOADISO
      wget -c "$DOWNLOADISO" && read -p 'PRESS ENTER TO CONTINUE...' && continue

    elif [ $CHOICE_OPTION == '5' ] || [ $CHOICE_OPTION == '05' ] ; then
      clear && exit

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
   read -p 'PRESS ENTER TO CONTINUE...'
   qemuCLI
   #cd $HOME/.QemuVM && clear && printf "Rodando qemu..." && qemu-system-x86_64 --enable-kvm -m "$RAMSIZE" -smp "$NUCLEOS" -name '$NAMEISO' -bios /usr/share/ovmf/OVMF.fd -hda "$HDNAME.qcow2" -cdrom "$ISONAME"

elif [ $UEFI_BIOS == '2' ] || [ $UEFI_BIOS =='02' ] ; then
   cd $HOME/.QemuVM && clear && printf "Rodando qemu..." && qemu-system-x86_64 --enable-kvm -m "$RAMSIZE" -smp "$NUCLEOS" -name '$NAMEISO' -boot d -hda "$HDNAME.qcow2" -cdrom "$ISONAME"

else
  printf "Opção inexistente (PRESS ENTER TO CONTINUE...)"
  qemuCLI
fi
}

init
