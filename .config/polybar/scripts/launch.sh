#!/usr/bin/env sh
# Credit: Franklin Souza
# Telegram: @FranklinTech

# Script para subir a polybar

# Se quiser só a bar de baixo, comenta a (polybar -q top &) se quiser só a bar de cima comenta a (polybar -q bottom &)

# E se quiser as duas, deixa ambas descomentas

# Terminar instâncias de barra já em execução
killall -q polybar

# Aguarde até que os processos sejam encerrados
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar -q -r up &
polybar -q -r down &
