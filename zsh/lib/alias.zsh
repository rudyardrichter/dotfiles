alias c='cat'
alias e='mvim'
alias o='open'
alias emacs='vim'
alias map='xargs -n1'
alias mkdir='mkdir -p'
alias reload='source ~/.zshrc'
alias psa='ps aux'
alias psg='ps aux | grep'
alias py='python'

# ls
alias l='gls -A --color=auto'
alias ll='gls -Aho --color=auto'
alias lr='gls -AR --color=auto'
alias ls='gls --color=auto'

# directories
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
alias -- -='cd -'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'
alias d='dirs -v | head -10'

# git
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gau='git add --update'
alias gb='git branch'
alias gba='git branch -a'
alias gbda='git branch --merged | command grep -vE "^(\*|\s*master\s*$)" | tr -d ' ' | xargs -n 1 git branch -d'
alias gbl='git blame -b -w'
alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gcn!='git commit -v --no-edit --amend'
alias gca='git commit -v -a'
alias gca!='git commit -v -a --amend'
alias gcam='git commit -a -m'
alias gcan!='git commit -v -a --no-edit --amend'
alias gcb='git checkout -b'
alias gcf='git config --list'
alias gch='git checkout'
alias gchm='git checkout master'
alias gcl='git clone --recursive'
alias gclean='git clean -fd'
alias gcm='git commit -m'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias gcs='git commit -S'
alias gd='git diff'
alias gdc='git diff --cached'
alias gds='git diff --stat'
alias gdw='git diff --word-diff'
alias gf='git fetch'
alias gfa='git fetch --all --prune'
alias gfo='git fetch origin'
pretty_fmt="format:'%C(yellow)%h %C(cyan)%s %C(auto)%d%Creset%n        %an <%ae>%n        %ai (%cr)%n'"
pretty_short_fmt="format:'%C(yellow)%h %Creset%s %C(auto)%d%Creset'"
alias gg="git log --graph --pretty=$pretty_fmt"
alias gga="git log --graph --all --pretty=$pretty_fmt"
alias ggan="git log --graph --all --name-status --pretty=$pretty_fmt"
alias ggao="git log --graph --all --pretty=$pretty_short_fmt"
alias ggap="git log --graph --all -p --pretty=$pretty_fmt"
alias ggaps="git log --graph --all -p --stat --pretty=$pretty_fmt"
alias ggas="git log --graph --all --stat --pretty=$pretty_fmt"
alias ggn="git log --graph --name-status --pretty=$pretty_fmt"
alias ggo="git log --graph --pretty=$pretty_short_fmt"
alias ggp="git log --graph -p --pretty=$pretty_fmt"
alias ggps="git log --graph -p --stat --pretty=$pretty_fmt"
alias ggs="git log --graph --stat --pretty=$pretty_fmt"
alias gl='git pull'
alias gm='git merge'
alias gmom='git merge origin/master'
alias gp='git push'
alias gpristine='git reset --hard && git clean -dfx'
alias gr='git remote'
alias gra='git remote add'
alias grb='git rebase'
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
alias grmv='git remote rename'
alias grrm='git remote remove'
alias grset='git remote set-url'
alias gs='git status -s'
alias gst='git status'
