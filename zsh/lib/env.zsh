export EDITOR='nvim'
export GIT_EDITOR='nvim'
export PAGER='less'
export LESS='-R'
export TERM=xterm-256color
export GOPATH="/Users/rudyardrichter/go"

#export PYTHONPATH="/usr/local/lib/python2.7/site-packages:/Users/rudyardrichter/Library/Python/2.7:$PYTHONPATH)"

source "/usr/local/bin/virtualenvwrapper.sh"
export WORKON_HOME="$HOME/envs"

gettext="/usr/local/opt/gettext/bin"
user_binaries="/Users/rudyard/bin"
python_binaries="/Users/rudyard/Library/Python/2.7/bin"
tex_binaries="/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin"
export PATH="$gettext:$user_binaries:$python_binaries:$tex_binaries:$PATH"
