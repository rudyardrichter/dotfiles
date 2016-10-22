# completion ignore
## vim
zstyle ":completion:*:*:*vim:*:*files" ignored-patterns \
    "*?.o" "*?.hi" "*?.aux" "*?.pdf" "*?.gz" "*?.log" "*?.out" "*?.aes" "*?.toc"
## open
zstyle ":completion:*:*:pdf:*:*" file-patterns '*.pdf'

################################################################################
# TODO: FIXME

WORDCHARS=''

zmodload -i zsh/complist

## case-insensitive (all),partial-word and then substring completion
if [ "x$CASE_SENSITIVE" = "xtrue" ]; then
  zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
  unset CASE_SENSITIVE
else
  if [ "x$HYPHEN_INSENSITIVE" = "xtrue" ]; then
    zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
    unset HYPHEN_INSENSITIVE
  else
    zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
  fi
fi

# should this be in keybindings?
bindkey -M menuselect '^o' accept-and-infer-next-history

zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"

# disable named-directories autocompletion
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

# Use caching so that commands like apt and dpkg complete are useable
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path $ZSH/cache

# ... unless we really want to.
zstyle '*' single-ignored show
