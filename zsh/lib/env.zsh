export EDITOR='nvim'
export GIT_EDITOR='nvim'
export PAGER='less'
export LESS='-R'
export TERM=xterm-256color
export GOPATH="/home/rudyard/go"

export REVIEW_BASE=master

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!.git/*" -g "!*.pyc"'
export FZF_DEFAULT_OPTS='--reverse'

#export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
#export VIRTUALENVWRAPPER_VIRTUALENV=/Users/rudyardrichter/Library/Python/2.7/bin/virtualenv
#export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
source /home/rudyard/.local/bin/virtualenvwrapper.sh
export WORKON_HOME=~/.envs

export RUST_SRC_PATH="/home/rudyard/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src/"

export GOROOT=/usr/local/go
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
eb="/home/rudyard/.ebcli-virtual-env/executables"
export PATH="$colors:$user_binaries:$rust_binaries:$go_binaries:$tex:$npm:$fzf:$eb:$PATH"
