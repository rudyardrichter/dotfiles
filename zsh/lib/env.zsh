export EDITOR='nvim'
export GIT_EDITOR='nvim'
export PAGER='less'
export LESS='-R'
export TERM=xterm-256color
export GOPATH="/Users/rudyardrichter/go"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!.git/*" -g "!*.pyc"'
export FZF_DEFAULT_OPTS='--reverse'

#export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
#export VIRTUALENVWRAPPER_VIRTUALENV=/Users/rudyardrichter/Library/Python/2.7/bin/virtualenv
#export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
#source /Users/rudyardrichter/Library/Python/2.7/bin/virtualenvwrapper.sh
export WORKON_HOME=~/envs

#export PYTHONPATH="/usr/local/lib/python2.7/site-packages:/Users/rudyardrichter/Library/Python/2.7:$PYTHONPATH)"

gettext="/usr/local/opt/gettext/bin"
user_binaries="$HOME/bin"
rust_binaries="$HOME/.cargo/bin"
#tex_binaries="/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin"
export PATH="$user_binaries:$rust_binaries:$PATH"
