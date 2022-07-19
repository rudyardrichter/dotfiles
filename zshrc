export ZSH=~/dotfiles/zsh
export THEME=gruvbox
export CLICOLOR=1

autoload -Uz compinit
compinit

lib_files=(
    env compfix completion grep history local opt termsupport syntax theme \
    key-bindings key abbreviations functions alias \
)

for file in ${lib_files[@]}; do
    source $ZSH/lib/$file.zsh
done
#if [[ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]]; then
#    compinit
#else
#    compinit -C
#fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$HOME/.poetry/bin:$PATH"

# Created by `pipx` on 2022-07-18 22:06:56
export PATH="$PATH:/Users/rudyard/Library/Python/3.8/bin"

# Created by `pipx` on 2022-07-18 22:07:01
export PATH="$PATH:/Users/rudyard/.local/bin"

autoload -Uz compinit
compinit
