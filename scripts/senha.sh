#!/usr/bin/env bash

# Franklin Souza
# Telegram: @FranklinTech

# Dep: xclip

clear
[ ! `command -v xclip` ] && echo "xclip não instalado, por favor faça a instalação" && exit 1

while true ; do
	# Menu
	clear
	printf "Gerador de senhas\n\n"
	printf "[1] - Gerar uma senha\n"
	printf "[2] - Sair\n\n"
	read OPC
	
	if [ $OPC == '1' ] || [ $OPC == '01' ] ; then
		chars=60 # -> Caracteres
		senha="$(openssl rand -base64 $chars)" # -> Gerando a senha
		echo "${senha}" | xclip -selection clipboard -rmlastnl # -> Colocando a senha no xclip (clipboard)
		printf "\n$senha\n\n" && read -p 'PRESSIONE ENTER PARA CONTINUAR...' && continue # -> Printando a senha para o(a) usuario(a)!!!

	elif [ $OPC == '2' ] || [ $OPC == '02' ] ; then
		clear && exit # -> Limpando tela e saindo do programa
	
	else
		clear && read -p 'Opção inexistente PRESSIONE ENTER PARA CONTINUAR...' && continue # -> Opção inexistente, entrando no loop
	fi
done
