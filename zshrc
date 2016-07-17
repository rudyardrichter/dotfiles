################################################################################

# MAIN SETTINGS
export EDITOR='vim'
export PAGER='less'
export LESS='-R'
export ZSH=/home/rudyard/dotfiles/zsh
THEME=arete

################################################################################

# setopts
setopt interactivecomments
setopt long_list_jobs
setopt auto_menu
setopt complete_in_word
setopt always_to_end
unsetopt menu_complete
unsetopt flowcontrol

################################################################################

# AUTOMATED SETTINGS

# Libraries
for file in $ZSH/lib/*.zsh; do
    source $file
done
# Theme
autoload -Uz colors && colors
source $ZSH/themes/$THEME.zsh

# ls colors & tab completion colors
eval `dircolors $ZSH/colors/dircolors.ansi-dark`
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# use vi mode
bindkey -v
# fix things
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
bindkey '^j' vi-cmd-mode
bindkey -M vicmd v edit-command-line
# no delay between vi mode switches
set -s escape-time 0
export KEYTIMEOUT=1

# fix a couple vi mode bugs
mode=$I
function TRAPINT() {
    mode=$I
    return $((128 + $1))
}

# define LC_CTYPE if necessary
if [[ -z "$LC_CTYPE" && -z "$LC_ALL" ]]; then
    export LC_CTYPE=${LANG%%:*} # pick the first entry from LANG
fi

################################################################################

# Completion
autoload -Uz compaudit compinit
compaudit
compinit

################################################################################
