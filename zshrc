################################################################################

# MAIN SETTINGS
export EDITOR='vim'
export PAGER='less'
export LESS='-R'
export ZSH=~/dotfiles/zsh
THEME=arete

export PATH="/home/rudyardrichter/bin:/software/slurm-current-el6-x86_64/bin:/software/git-2.7-el6-x86_64/bin:/software/emacs-24-el6-x86_64/bin:/software/subversion-1.8-el6-x86_64/bin:/software/vim-7.4-el6-x86_64/bin:/software/bin:/srv/adm/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/lpp/mmfs/bin"

################################################################################

# setopts
setopt interactivecomments
setopt long_list_jobs
unsetopt menu_complete
unsetopt flowcontrol
setopt auto_menu
setopt complete_in_word
setopt always_to_end
setopt extendedglob

################################################################################

# ABBREVIATIONS

typeset -Ag abbreviations
abbreviations=(
    "G"        "| grep"
    "EG"       "| egrep"
    "AG"       "| agrep"
    "H"        "| head"
    "T"        "| tail"
    "S"        "| sort"
    "W"        "| wc"
    "X"        "| xargs"
)

magic-abbrev-expand() {
    local MATCH
    LBUFFER=${LBUFFER%%(#m)[_a-zA-Z0-9]#}
    LBUFFER+=${abbreviations[$MATCH]:-$MATCH}
    zle self-insert
}

no-magic-abbrev-expand() {
    LBUFFER+=' '
}

zle -N magic-abbrev-expand
zle -N no-magic-abbrev-expand
bindkey " " magic-abbrev-expand
bindkey "^x " no-magic-abbrev-expand
bindkey -M isearch " " self-insert

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
bindkey '^P' up-line-or-search
bindkey '^N' down-line-or-search
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
