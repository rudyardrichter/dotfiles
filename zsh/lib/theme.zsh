# Theme
autoload -Uz colors && colors
source $ZSH/themes/arete.zsh

# ls colors & tab completion colors
eval `dircolors $ZSH/colors/dircolors.ansi-dark`
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
