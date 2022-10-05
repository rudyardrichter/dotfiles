# Enable auto-suggestions.
#source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
#export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=100"

autoload -Uz compinit
compinit

# completion ignore
## vim
zstyle ":completion:*:*:*vim:*:*files" ignored-patterns \
    "*?.o" "*?.hi" "*?.aux" "*?.pdf" "*?.gz" "*?.log" "*?.out" "*?.aes" \
    "*?.toc" "*?.pyc" "*.egg-info*"
zstyle ":completion:*:*:e:*:*files" ignored-patterns \
    "*?.o" "*?.hi" "*?.aux" "*?.pdf" "*?.gz" "*?.log" "*?.out" "*?.aes" \
    "*?.toc" "*?.pyc" "*.egg-info*"

WORDCHARS=''

zmodload -i zsh/complist

# activate-global-python-argcomplete --user
# eval "$(register-python-argcomplete pipx)"

# should this be in keybindings?
bindkey -M menuselect '^o' accept-and-infer-next-history

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"

# Make dash and underscore equivalent in completion.
#zstyle ':completion:*' matcher-list '' 'm:{-_}={_-}'

# Disable named-directories autocompletion.
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

# Use caching so that commands like apt and dpkg complete are useable.
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"
zstyle ':completion:*' squeeze-slashes

zstyle '*' single-ignored show

#source $HOME/.dynamic-colors/completions/dynamic-colors.zsh

#source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
#export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"

# AWS CLI completions
# source /usr/share/zsh/vendor-completions/_awscli

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*:*:*:*:*' menu select
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} "ma=48;5;10;1"
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} "ma=48;5;63;1"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} "ma=48;5;10;1"
#zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' max-errors 1
zstyle ':completion:*' squeeze-slashes true

#zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==02=01}:${(s.:.)LS_COLORS}")'
