export EDITOR='nvim'
export GIT_EDITOR='nvim'
export PAGER='less'
export LESS='-R'
export WORKON_HOME=~/envs && source /usr/local/bin/virtualenvwrapper.sh
source /usr/local/bin/virtualenvwrapper.sh
tex_binaries="/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin"
user_binaries="/users/rudyardrichter/bin"
export PATH="$user_binaries:$tex_binaries:$PATH"
