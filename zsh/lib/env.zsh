export EDITOR='nvim'
export GIT_EDITOR='nvim'
export PAGER='less'
export LESS='-R'
export TERM=xterm-256color
export ZLE_REMOVE_SUFFIX_CHARS=""
export USE_EMOJI='false'
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE

export REVIEW_BASE=master
export GPG_TTY=$(tty)

export SSH_AUTH_SOCK=/Users/rr/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!.git/*" -g "!*.pyc"'
export FZF_DEFAULT_OPTS='--reverse'

export GOPATH=~/go
export GOBIN=~/go/bin

gettext="/usr/local/opt/gettext/bin"
user_binaries="$HOME/bin"
rust_binaries="$HOME/.cargo/bin"
go_binaries=$GOBIN
tex="/usr/local/texlive/2017/bin/x86_64-linux"
npm="$HOME/.npm/bin/"
colors="$HOME/.dynamic-colors/bin"
fzf="$HOME/.fzf/bin"
eb="$HOME/.ebcli-virtual-env/executables"
poetry="$HOME/.poetry/bin"
nvm_binaries="$HOME/.nvm/versions/node/v16.17.1/bin"
mac_python="$HOME/Library/Python/3.9/bin"
export PATH="$colors:$user_binaries:$rust_binaries:$go_binaries:$tex:$npm:$fzf:$eb:$poetry:$nvm_binaries:$mac_python:$PATH"
