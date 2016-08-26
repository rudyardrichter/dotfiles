export ZSH=~/dotfiles/zsh

for file in $ZSH/lib/*.zsh; do
    source $file
done

autoload -Uz compaudit compinit
compaudit
compinit
