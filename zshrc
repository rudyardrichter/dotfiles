export EDITOR='vim'
export PAGER='less'
export LESS='-R'
export ZSH=~/dotfiles/zsh
THEME=arete
export PATH="/Users/rudyard/Library/Haskell/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/usr/texbin:/Users/rudyard/bin:$GEM_HOME/bin"

setopt vi                      # allow vi mode
setopt interactivecomments     # allow comments in shell
setopt long_list_jobs          # list jobs in long format
setopt auto_menu               # use menu completion
setopt complete_in_word        # allow tab completion inside words
setopt always_to_end           # move cursor to end of word after completion
setopt extendedglob            # treat '#', '~', and '^' as patterns
setopt append_history          # append to history rather than replacing
setopt extended_history        # save timestamp and duration in history
setopt hist_expire_dups_first  # delete oldest duplicates first
setopt hist_ignore_dups        # ignore duplication command history list
setopt hist_ignore_space       # ignore space-prefaced commands for history
setopt hist_verify             # load (don't run) history expansions
setopt inc_append_history      # append history lines when they are entered
setopt share_history           # share command history data
unsetopt menu_complete         # don't jump to first match in menu
unsetopt flowcontrol           # disable flow control via start/stop chars

# Theme
autoload -Uz colors && colors
source $ZSH/themes/$THEME.zsh

# ls colors & tab completion colors
eval `dircolors $ZSH/colors/dircolors.ansi-dark`
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

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
