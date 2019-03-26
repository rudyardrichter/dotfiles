export ZSH=~/dotfiles/zsh
if [[ $BG == "light" ]]; then
    export THEME=arete-light
else
    export THEME=arete
fi

lib_files=(
    env compfix completion grep history local opt termsupport syntax theme \
    key-bindings key abbreviations functions alias \
)

for file in ${lib_files[@]}; do
    source $ZSH/lib/$file.zsh
done

autoload -Uz compinit
#if [[ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]]; then
#    compinit
#else
#    compinit -C
#fi
