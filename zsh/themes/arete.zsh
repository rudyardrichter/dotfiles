setopt prompt_subst

git_status () {
    _INDEX=$(git status --porcelain -b 2> /dev/null)
    _STATUS=""
    # staged
    $(echo "$_INDEX" | grep '^[AMRD]. ' &> /dev/null) && _STATUS="$_STATUS%{$fg[green]%}•%{$reset_color%}"
    # unstaged
    $(echo "$_INDEX" | grep '^.[MTD] ' &> /dev/null) && _STATUS="$_STATUS%{$fg[yellow]%}•%{$reset_color%}"
    # untracked
    $(echo "$_INDEX" | grep '^\?\? ' &> /dev/null) && _STATUS="$_STATUS%{$fg[red]%}•%{$reset_color%}"
    # unmerged
    $(echo "$_INDEX" | grep '^UU ' &> /dev/null) && _STATUS="$_STATUS%{$fg[red]%}?%{$reset_color%}"
    # stashed
    $(git rev-parse --verify refs/stash >/dev/null 2>&1) && _STATUS="$_STATUS%{$fg_bold[magenta]%}∘%{$reset_color%}"
    # ahead
    $(echo "$_INDEX" | grep '^## .*ahead' &> /dev/null) && _STATUS="$_STATUS%{$fg[cyan]%}▲%{$reset_color%}"
    # behind
    $(echo "$_INDEX" | grep '^## .*behind' &> /dev/null) && _STATUS="$_STATUS%{$fg[magenta]%}▼%{$reset_color%}"
    # diverged
    $(echo "$_INDEX" | grep '^## .*diverged' &> /dev/null) && _STATUS="$_STATUS%{$fg_bold[red]%}≠%{$reset_color%}"
    echo $_STATUS
}

git_prompt () {
    local _result=""
    local _branch="$(git symbolic-ref --short HEAD 2> /dev/null)"
    if [ "$_branch" ]; then
        _result="[%{$fg[white]%}$_branch"
        local _status=$(git_status)
        [ "$_status" ] && _result="$_result $_status"
        _result="$_result%{$reset_color%}]"
    fi
    echo $_result
}

autoload -Uz git_status git_prompt

if [[ $EUID -eq 0 ]]; then
    _USERNAME="%{$fg_bold[red]%}%n%{$reset_color%}@%m"
    _PROMPT="%{$fg[red]%}#"
else
    _USERNAME="%{$fg_bold[white]%}%n%{$reset_color%}@%m"
    _PROMPT="%{$fg[green]%}$"
fi

PROMPT="$_USERNAME %{$fg_bold[white]%}%~%{$reset_color%}
$_PROMPT%{$reset_color%} "

N="%{$fg_bold[white]%}N%{$reset_color%}"
I="%{$fg[yellow]%}I%{$reset_color%}"


function zle-keymap-select {
    mode="${${KEYMAP/vicmd/${N}}/(main|viins)/${I}}"
    zle reset-prompt
}

zle -N zle-keymap-select

mode=$I
precmd() { mode=$I }
RPROMPT='$(git_prompt)[${mode}]'
