export ZSH=~/dotfiles/zsh
export THEME=arete

lib_files=(
    alias compfix completion env functions grep history local opt \
    termsupport syntax theme key-bindings key abbreviations \
)

for file in ${lib_files[@]}; do
    source $ZSH/lib/$file.zsh
done

autoload -Uz compinit
if [[ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]]; then
    compinit
else
    compinit -C
fi
