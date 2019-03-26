# colorize man pages
export LESS_TERMCAP_mb=$(printf "\e[32m")
export LESS_TERMCAP_md=$(printf "\e[97m")
export LESS_TERMCAP_me=$(printf "\e[0m")
export LESS_TERMCAP_se=$(printf "\e[0m")
export LESS_TERMCAP_so=$(printf "\e[43;30m")
export LESS_TERMCAP_ue=$(printf "\e[33m")
export LESS_TERMCAP_us=$(printf "\e[1;31m")

# ls colors & tab completion colors
eval `dircolors $ZSH/colors/dircolors.ansi-dark`
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

setopt prompt_subst

git_status () {
    _INDEX=$(git status --porcelain -b 2> /dev/null)
    _STATUS=""
    # staged
    $(echo "$_INDEX" | grep '^[AMRD]. ' &> /dev/null) && _STATUS="$_STATUS%{$fg[green]%}•%{$reset_color%}"
    # unstaged
    $(echo "$_INDEX" | grep '^.[MTD] ' &> /dev/null) && _STATUS="$_STATUS%{$fg[yellow]%}•%{$reset_color%}"
    # untracked
    $(echo "$_INDEX" | grep '^?? ' &> /dev/null) && _STATUS="$_STATUS%{$fg[red]%}•%{$reset_color%}"
    # unmerged
    $(echo "$_INDEX" | grep '^UU ' &> /dev/null) && _STATUS="$_STATUS%{$fg[red]%}?%{$reset_color%}"
    # stashed
    $(git rev-parse --verify refs/stash > /dev/null 2>&1) && _STATUS="$_STATUS%{$fg_bold[magenta]%}•%{$reset_color%}"
    # ahead
    $(echo "$_INDEX" | grep '^## .*ahead' &> /dev/null) && _STATUS="$_STATUS%{$fg[cyan]%}▲%{$reset_color%}"
    # behind
    $(echo "$_INDEX" | grep '^## .*behind' &> /dev/null) && _STATUS="$_STATUS%{$fg[magenta]%}▼%{$reset_color%}"
    # diverged
    $(echo "$_INDEX" | grep '^## .*diverged' &> /dev/null) && _STATUS="$_STATUS%{$fg_bold[red]%}⧎%{$reset_color%}"
    echo $_STATUS
}

git_prompt () {
    local _branch="$(git symbolic-ref --short HEAD 2> /dev/null)"
    if [ "$_branch" ]; then
        #_result="[%{$fg[white]%}$_branch"
        _result="%{$fg[cyan]%}$_branch"
        local _status=$(git_status)
        [ "$_status" ] && _result="$_result $_status"
        echo "  $_result%{$reset_color%}"
    fi
}

autoload -Uz git_status git_prompt

if [[ $EUID -eq 0 ]]; then
    _USERNAME="%{$fg_bold[red]%}%n%{$reset_color%}@%m"
    _PROMPT="%{$fg[red]%}#"
else
    #_USERNAME="%{$fg[cyan]%}%n@%m%{$reset_color%}"
    #_USERNAME="%n@%m"
    _USERNAME="%{$fg_bold[green]%}%n@%m%{$reset_color%}"
    _PROMPT="%{$fg[green]%}$"
fi

N="[%{$fg_bold[white]%}NORMAL%{$reset_color%}]"
I=""

function zle-keymap-select {
    mode="${${KEYMAP/vicmd/${N}}/(main|viins)/${I}}"
    zle reset-prompt
}

zle -N zle-keymap-select

mode=$I
precmd() { mode=$I }

PROMPT="$_USERNAME %{$fg_bold[white]%}%~%{$reset_color%}\$(git_prompt)
$_PROMPT%{$reset_color%} "
RPROMPT='${mode}'
