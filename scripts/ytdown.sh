#!/bin/env bash

# Franklin Souza
# FraklinTech

# Init
mkdir ~/.VideosDownload
SOUND=/usr/share/sounds/freedesktop/stereo/complete.oga
clear

# Yad
LINK=$(\
yad --entry \
--entry-label="LINK:" \
--entry-text="SEU LINK DO YOUTUBE AQUI" \
--completion \
--editable \
	--title="Download vídeos do YouTube" \
	--width="400" \
)

# Download vídeos
cd $HOME/.VideosDownload && yt-dlp "$LINK" && notify-send "Vídeo baixado com sucesso!!!" && mpv $SOUND && clear && exit 0

