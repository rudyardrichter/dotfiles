export EDITOR='vim'
export PAGER='less'
export LESS='-R'
export ZSH=~/dotfiles/zsh
THEME=arete
export PATH="/home/rudyardrichter/bin:/software/slurm-current-el6-x86_64/bin:/software/git-2.7-el6-x86_64/bin:/software/emacs-24-el6-x86_64/bin:/software/subversion-1.8-el6-x86_64/bin:/software/vim-7.4-el6-x86_64/bin:/software/bin:/srv/adm/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/lpp/mmfs/bin"

setopt interactivecomments
setopt long_list_jobs
setopt auto_menu
setopt complete_in_word
setopt always_to_end
setopt extendedglob
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data
unsetopt menu_complete
unsetopt flowcontrol

# Theme
autoload -Uz colors && colors
source $ZSH/themes/$THEME.zsh

# ls colors & tab completion colors
eval `dircolors $ZSH/colors/dircolors.ansi-dark`
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

bindkey -v   # vi mode
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^P' up-line-or-search
bindkey '^N' down-line-or-search
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' forward-word
bindkey '^b' backward-word
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

autoload -Uz compaudit compinit
compaudit
compinit

for file in $ZSH/lib/*.zsh; do
    source $file
done
