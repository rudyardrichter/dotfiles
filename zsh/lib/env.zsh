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
source /usr/local/bin/virtualenvwrapper.sh
export WORKON_HOME=~/.envs

#export PYTHONPATH="/usr/local/lib/python2.7/site-packages:/Users/rudyardrichter/Library/Python/2.7:$PYTHONPATH)"

export GOROOT=/usr/local/go
export GOPATH=~/go
export GOBIN=~/go/bin

gettext="/usr/local/opt/gettext/bin"
user_binaries="$HOME/bin"
rust_binaries="$HOME/.cargo/bin"
go_binaries=$GOBIN
tex="/usr/local/texlive/2017/bin/x86_64-linux"
npm="/home/rudyard/.npm/bin/"
export PATH="$user_binaries:$rust_binaries:$go_binaries:$tex:$npm:$PATH"
export MANATH="/usr/local/texlive/2017/texmf-dist/doc/man"
export INFOPATH="/usr/local/texlive/2017/texmf-dist/doc/info"
export RUST_SRC_PATH="/home/rudyard/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src/"
