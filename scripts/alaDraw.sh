#!/bin/env bash
# atualmente não está colocando alacritty nos X e Y reais (tentando acertar)

# desenhando um retângulo com slop
read -r X Y W H < <(slop -f "%x %y %w %h" --color=0.23,0.70,0.30,0.8 -b 1 -t 0 -q)

# Depende da largura e altura da fonte
(( W /= 6 ))
(( H /= 12 ))

# para depurar o tamanho
#echo $W $H $X $Y

# Alacritty normal
alacritty -v --title "aladraw" --dimensions $W $H --position $X $Y

# Alacritty com ligatures
#alacritty --title "aladraw" --dimensions $W $H --position $X $Y
