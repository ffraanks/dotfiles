source "$HOME"/.aliases # My Aliases

# Starship
eval "$(starship init zsh)"  # Theme Starship

# Pywal
(cat ~/.cache/wal/sequences &)
cat ~/.cache/wal/sequences
source ~/.cache/wal/colors-tty.sh
. $HOME/.cache/wal/colors.sh

# History ZSH
HISTFILE=~/.zhistory # My zsh history
HIST_SIVE=1000 # Size history list
SAVEHIST=500 # Size history list

# Plugins
PLUGIN=(zsh-completion)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh     # Plugin Syntax
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh      # Plugin Autosuggestions
source /home/frank/.projects/zsh-async/async.plugin.zsh

# Configurations
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]= r:|=' 'l:|=* r:|=*'
zstyle :compinstall filename '/home/frank/.zshrc'

autoload -Uz compinit
autoload -Uz async && async
compinit

ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_MANUAL_REBIND=true

CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true"

# Functions

_my_prompt() {
	async_init

	# cache variable
	typeset -Ag prompt_data

	# section for dir
	function prompt_dir() {
		echo '%F{blue}%0~%f'
	}

	# section for git branch
	function prompt_git() {
		cd -q $1
		getbranch
	}

	# refresh prompt with new data
	prompt_refresh() {
		PROMPT="$prompt_data[prompt_git]$prompt_data[prompt_dir] %(?..%F{red})\$ %f"
		# Redraw the prompt.
		zle && zle .reset-prompt
	}

	prompt_callback() {
		local job=$1 code=$2 output=$3 exec_time=$4
		prompt_data[$job]=$output
		prompt_refresh
	}

	# Start async worker
	async_start_worker 'prompt' -n
	# Register callback function for the workers completed jobs
	async_register_callback 'prompt' prompt_callback

	# start async jobs before cmd
	prompt_precmd() {
		async_job 'prompt' prompt_dir
		async_job 'prompt' prompt_git $PWD # required
	}

	# Setup
	zmodload zsh/zle
	autoload -Uz add-zsh-hook
	add-zsh-hook precmd prompt_precmd
}

# entering calculator mode
bindkey -s '^a' 'bc -l\n'

# you can put as many files do you want
0x0() {
for i in "$@"; do
    curl -F file=@$i http://0x0.st
done
}

# play video based on the clipboard
play() {
        mpv "$(wl-paste 2>/dev/null || xclip -o 2>/dev/null)"
}

# download file based on the clipboard
down() {
    mkdir $HOME/.Downloads
		cd $HOME/.Downloads
		aria2c "$(wl-paste 2>/dev/null || xclip -o 2>/dev/null)"
}

# play audio based search
yplay() {
    mpv --input-ipc-server=/tmp/mpvcmd --ytdl-format=bestaudio ytdl://ytsearch:"$*"
}

# play music for programming
pg() {
    mpv --ytdl-format=bestaudio ytdl://ytsearch:"Música Chillstep para Programação / Cyber / CodificaçãO"
}

# bad music
bd(){
	 mpv --ytdl-format=bestaudio ytdl://ytsearch:"hometown xirali-3 1hour"
 }

redshift(){
# redshift -O number (Ativa o redshift)
# redshift -x volta ao valor padrão
	redshift $@ && clear
}

br(){
	xrandr --output VGA-0 --brightness $@ && clear
}

pkginf() {
    clear && pacman -Si $@ | awk '/Name/{print "Package: " $3}/Version/{print "Version: " $3}/Installed Size/{printf "Size: %s %s\n", $4, $5}'
}

pkginf1() {
   clear && pacman -Q $@
}

device() {
	adb tcpip 5555 && adb connect 192.168.0.101:5555
}

usage() {
    for p in "$@" ; do
        if pidof $p >/dev/null ; then
            RAM=$(echo $(ps -A --sort -rsz -o comm,rss | grep $p | sed -n 1p | sed 's/.* //g') / 1000 | bc)
            PRAM=$(ps -A --sort -rsz -o comm,pmem | grep $p | sed -n 1p | sed 's/.* //g')
            PCPU=$(ps -A --sort -rsz -o comm,pcpu | grep $p | sed -n 1p | sed 's/.* //g')
            echo "$p is using ${RAM}mb of RAM (${PRAM}%) and ${PCPU}% of CPU"
        else
            echo "$p is not running"
        fi
    done
}

# To-do list
# -> Cria e lista as tarefas
export TODO="${HOME}/Documents/.todo.txt"
tla() { [ $# -eq 0 ] && cat $TODO || echo "$(echo $* | md5sum | cut -c 1-4)   $*" >> $TODO ;}

# -> Remove as tarefa do todo.txt
tlr() { sed -i "/^$*/d" $TODO ;}

#printf "Bem vindo(a) ao zsh!!!\n"
