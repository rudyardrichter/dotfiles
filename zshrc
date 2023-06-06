export ZSH=~/dotfiles/zsh
export THEME=gruvbox

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$HOME/.poetry/bin:$PATH"

# Created by `pipx` on 2022-08-01 18:52:43
export PATH="$PATH:/home/rudyard/.local/bin"
#
## >>> conda initialize >>>
## !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/home/rudyard/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/home/rudyard/anaconda3/etc/profile.d/conda.sh" ]; then
#        . "/home/rudyard/anaconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/home/rudyard/anaconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
## <<< conda initialize <<<
#

[ -f "/home/rudyard/.ghcup/env" ] && source "/home/rudyard/.ghcup/env" # ghcup-env