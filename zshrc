################################################################################

# SETTINGS
export ZSH=/Users/rudyard/.zsh
ZSH_THEME=arete
plugins=(git)

################################################################################

setopt auto_cd

# Libraries
for file in $ZSH/lib/*.zsh; do
    source $file
done
# Theme
autoload -Uz colors && colors
source $ZSH/themes/$ZSH_THEME.zsh


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

# aliases
alias e='mvim'
alias o='open'
alias l='gls -A --color=auto'
alias ll='gls -Ahl -o --color=auto'
alias lr='gls -AR --color=auto'
alias ls='gls --color=auto'

eval "$(thefuck --alias)"
alias fak='fuck'

# completion ignore
## vim
zstyle ":completion:*:*:*vim:*:*files" ignored-patterns \
    "*?.o" "*?.hi" "*?.aux" "*?.pdf" "*?.gz" "*?.log" "*?.out" "*?.aes" "*?.toc"
## open
zstyle ":completion:*:*:open:*:*files" ignored-patterns \
    "*?.tex" "*?.gz" "*?.aes"
# "^*.*"

aes-encrypt() {
    target="$1.aes"
    openssl aes-128-cbc -salt -in $1 -out $target
}

aes-decrypt() {
    tarball="${$(basename $1)%.*}"
    openssl aes-128-cbc -d -in $1 -out $tarball
}

backup() {
    filename="${$(basename $1)%.*}"
    tarball="$filename.tar.gz"
    tar czf $tarball $1
    aes-encrypt $tarball
    rm $tarball
}

# fix a couple vi mode bugs
mode=$I
function TRAPINT() {
    mode=$I
    return $((128 + $1))
}

source ~/.oh-my-zsh/syntax/zsh-syntax-highlighting.zsh
