# Source
source "$HOME"/.aliases # My Aliases
source "$HOME"/.scripts # My Scripts

# Starship
eval "$(starship init zsh)"  # Theme Starship

# Powerlevel10k
#source ~/.projects/powerlevel10k/powerlevel10k.zsh-theme

#Powerlevel10k
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

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
source /home/frank/.projects/zsh-async/async.plugin.zsh																# Plugin Async

# Configurations
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]= r:|=' 'l:|=* r:|=*'
zstyle :compinstall filename '/home/frank/.zshrc'

autoload -Uz compinit
autoload -Uz async && async
compinit

# Tetris
autoload -Uz tetriscurses

ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_MANUAL_REBIND=true

CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true"

# Init
#printf "Bem vindo(a) ao zsh!!!\n"
