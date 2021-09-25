#!/usr/bin/env bash
#
# Arquivo: syshw.sh
#
# Feito por Lucas Saliés Brum a.k.a. sistematico, <lucas@archlinux.com.br>
#
# Criado em: 16/03/2018 16:35:20
# Última alteração: 01/09/2020 00:20:17

while true ; do

	clear
	printf "[1] - Gerar senha\n"
	printf "[2] - Sair\n\n"
	read OPC
	
	if [ $OPC == '1' ] || [ $OPC == '01' ] ; then
		chars=32
		senha="$(openssl rand -base64 $chars)"
		echo "${senha}" | xclip -selection clipboard -rmlastnl
		echo $senha &&  read -p 'PRESS ENTER TO CONTINUE' && continue

	elif [ $OPC == '2' ] || [ $OPC == '02' ] ; then
		clear && exit
	else
		clear && read -p 'Opção invalida PRESS ENTER TO CONTINUE...' && continue
	fi
done
