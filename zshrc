################################################################################

# MAIN SETTINGS
export EDITOR='vim'
export PAGER='less'
export LESS='-R'
export ZSH=/Users/rudyard/dotfiles/zsh
THEME=arete

export PATH="/Users/rudyard/Library/Haskell/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/usr/texbin:/Users/rudyard/bin:$GEM_HOME/bin"

################################################################################

# setopts
setopt interactivecomments
setopt long_list_jobs

################################################################################

# AUTOMATED SETTINGS

# Libraries
for file in $ZSH/lib/*.zsh; do
    source $file
done
# Completion
autoload -Uz compinit && compinit -d ~/.zcompdump
# Theme
autoload -Uz colors && colors
source $ZSH/themes/$THEME.zsh

# ls colors
eval `gdircolors $ZSH/colors/dircolors.ansi-dark`
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
