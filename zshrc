export ZSH=~/dotfiles/zsh
export THEME=arete

lib_files=( alias compfix completion env functions grep history local opt \
            termsupport syntax theme key-bindings key abbreviations )

for file in ${lib_files[@]}; do
    source $ZSH/lib/$file.zsh
done

autoload -Uz compaudit compinit
compaudit
compinit
