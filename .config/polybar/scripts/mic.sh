#!/bin/zsh

# Depe:
# pulseaudio-ctl

polymic () 
{
	<<- example
	[module/mic]
	type = ipc
	type = custom/ipc
	hook-0 = echo "Mic Aberto"
	hook-1 = echo "Mic Fechado"
	click-left = mic.sh
	example

}

if [[ ${${(s: :)"$(pulseaudio-ctl full-status)"}[3]} == "yes" ]]; then
	pulseaudio-ctl mute-input
	polybar-msg hook mic 2
else
	pulseaudio-ctl mute-input
	polybar-msg hook mic 1
fi
