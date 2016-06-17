################################################################################

# SETTINGS
export ZSH=/Users/rudyard/.zsh
THEME=arete
plugins=(git)

################################################################################

# Libraries
for file in $ZSH/lib/*.zsh; do
    source $file
done
# Theme
autoload -Uz colors && colors
source $ZSH/themes/$THEME.zsh

export PATH="/Users/rudyard/Library/Haskell/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/usr/texbin:/Users/rudyard/bin:$GEM_HOME/bin"

# ls colors
eval `gdircolors $ZSH/colors/dircolors.ansi-dark`
# tab completion colors
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

export EDITOR='vim'
# use vi mode
bindkey -v
# fix things
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
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
