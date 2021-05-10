#!/usr/bin/env bash
# Credit: Franklin Souza
# Telgram: @FranklinTech
#
# Script para baixar vídeos de sites e do youtube
#
################################################################################

#xclip -out -selection primary | xclip -in -selection clipboard

SECONDS=0
comeco=$SECONDS
log=0 # 0 = Sem log, 1 = Log no arquivo erro.log
aria=0
ts=$(date +"%s")
dir="$HOME/VideoDown"
#dir="${HOME}/desk"
#dir="${HOME}/desk/$(ls -t -1 ${HOME}/desk | head -1)"
#icone="${HOME}/.local/share/icons/elementary/video-display.png"
som='complete'
tmp="/tmp/videodown/$$"
logs="${dir}/status.log"
proc=$(pgrep -fc "bash $0")

if [ ! -d $dir ]; then
	dir="$HOME/VideoDown"
	if [ ! -d $dir ]; then
		mkdir -p $dir
	fi
fi

[ ! -d $tmp ] && mkdir -p $tmp
[ $1 ] && url="$1" || url="$(xclip -o)"
cd $tmp

padrao='(https?|ftp|file)://[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]'
if [[ ! ${url} =~ $padrao ]]; then
	notify-send -i $icone "Video Downloader" "O link é inválido!"
    exit
else
	titulo="$(curl "$url" -so - | grep -iPo '(?<=<title>)(.*)(?=</title>)' | iconv -f utf8 -t ascii//TRANSLIT | sed 's/[^[:alnum:]]\+/ /g')"
fi

if [[ $log -ne 0 ]]; then
    echo "---------------------------------------------------------------" >> "$logs"
    echo "Status:       INICIO" >> "$logs"
    echo "Título:       $titulo" >> "$logs"
    echo "URL:          $url" >>"$logs"
    echo "Path:         $dir" >> "$logs"
    echo "Temp:         $tmp" >> "$logs"
    echo "Processos:    $proc" >> "$logs"
fi

notify-send -i $icone "Video Downloader" "Transferencia de: $titulo iniciada."

if [ $aria == 1 ]; then
    # -j, --max-concurrent-downloads
    # -x, --max-connection-per-server
    # -m, --max-tries
    # -k, --min-split-size
    # -s, --split restricted by --max-connection-per-server
    # -t, --timeout

    #youtube-dl -o "${titulo}.%(ext)s" --external-downloader aria2c --external-downloader-args '-l '$dir/aria.log' -t 10 -m 10 -c -j 2 -x 1 -s 2 -k 2M' "${url}"
    #youtube-dl -o "${titulo}.%(ext)s" --external-downloader aria2c --external-downloader-args '-l '$dir/aria.log' -t 10 -m 10 -c -j 4 -x 2 -s 2 -k 2M' "${url}"
	youtube-dl -o "${titulo}.%(ext)s" --external-downloader aria2c "${url}"
    status="$?"
else
    youtube-dl -o "${titulo}.%(ext)s" "${url}"
    status="$?"
fi

if [[ $status -ne 0 ]]; then
    echo "---------------------------------------------------------------" >> "$logs"
    echo "Status:       ERRO" >> "$logs"
    echo "Título:       $titulo" >> "$logs"
    echo "URL:          $url" >> "$logs"
    echo "Path:         $dir" >> "$logs"
    echo "Temp:         $tmp" >> "$logs"
    echo "Processos:    $proc" >> "$logs"
    echo "Código:       $status" >> "$logs"
    notify-send -i $icone "Video Downloader" "Erro na transferencia de: ${titulo}. Instâncias: $proc"
    canberra-gtk-play -i $som
    exit
fi

if [[ $status -eq 0 ]]; then
    if [[ $log -ne 0 ]]; then
        echo "---------------------------------------------------------------" >> "$logs"
        echo "Status:       SUCESSO" >> "$logs"
        echo "Título:       $titulo" >> "$logs"
        echo "URL:          $url" >> "$logs"
        echo "Path:         $dir" >> "$logs"
        echo "Temp:         $tmp" >> "$logs"
        echo "Processos:    $proc" >> "$logs"
    fi
    arquivos=$(ls "${titulo}"* | egrep -vi '.mp4|.avi|.mkv|.log')
    for i in "${arquivos[@]}"
    do
        if [ -f "$i" ]; then
            mod=$(stat -c "%Y" "$i")
            if [[ $mod > $ts ]]; then
                rm -f "$i"
            fi
        fi
    done

    if ls "${titulo}"* 1> /dev/null 2>&1; then
        if ls "${dir}/${titulo}"* 1> /dev/null 2>&1; then
            notify-send -i $icone "Video Downloader" "Já existe um arquivo:\n\n<b>$titulo</b>\n\nEm:\n\n$dir\n\nInstâncias: $proc"
            canberra-gtk-play -i $som
        else
        	final=$SECONDS
        	diff=$((final - comeco))
            tamanho=$(stat --printf="%s" "${titulo}"*)
            tamanho="$((tamanho / 1024))"

            hora=$(printf "%02d" $((diff / 3600)))
            minuto=$(printf "%02d" $((diff / 60)))
            segundo=$(printf "%02d" $((diff % 60)))

            tempo=$((tamanho / diff))

            if [ $tamanho -gt 1024 ]; then
                tamanho="$((tamanho / 1024)) MB"
            elif [ $tamanho -gt 1048576 ]; then
                tamanho="$((tamanho / 1024 / 1024)) GB"
            else
                tamanho="${tamanho} KB"
            fi

            notify-send -i $icone "Video Downloader" \
            "Sucesso, vídeo salvo: $titulo Em: $dir Tempo decorrido: ${hora}:${minuto}:${segundo} Tamanho do arquivo: ${tamanho} Velocidade média: ${tempo}KBps"
            mv "${titulo}"* "$dir"
            cd $dir && rm -rf $tmp
        fi
    else
        notify-send -i $icone "Video Downloader" "Erro na transferencia de:${tmp}/${titulo}. Instâncias: $proc"
        canberra-gtk-play -i $som
    fi
else
    notify-send -i $icone "Video Downloader" "Erro na transferencia de: $titulo Instâncias: $proc"
    canberra-gtk-play -i $som
fi
