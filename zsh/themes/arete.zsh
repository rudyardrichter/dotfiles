git_branch () {
  ref=$(command git symbolic-ref HEAD 2> /dev/null) || ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  echo "${ref#refs/heads/}"
}

git_status () {
  _INDEX=$(command git status --porcelain -b 2> /dev/null)
  _STATUS=""
  # staged
  if $(echo "$_INDEX" | grep '^[AMRD]. ' &> /dev/null); then
    _STATUS="$_STATUS%{$fg[green]%}•%{$reset_color%}"
  fi
  # unstaged
  if $(echo "$_INDEX" | grep '^.[MTD] ' &> /dev/null); then
    _STATUS="$_STATUS%{$fg[yellow]%}•%{$reset_color%}"
  fi
  # untracked
  if $(echo "$_INDEX" | command grep -E '^\?\? ' &> /dev/null); then
    _STATUS="$_STATUS%{$fg[red]%}•%{$reset_color%}"
  fi
  # unmerged
  if $(echo "$_INDEX" | grep '^UU ' &> /dev/null); then
    _STATUS="$_STATUS%{$fg_bold[red]%}?%{$reset_color%}"
  fi
  # stashed
  if $(command git rev-parse --verify refs/stash >/dev/null 2>&1); then
    _STATUS="$_STATUS%{$fg_bold[magenta]%}⦿%{$reset_color%}"
  fi
  # ahead
  if $(echo "$_INDEX" | grep '^## .*ahead' &> /dev/null); then
    _STATUS="$_STATUS%{$fg[cyan]%}▲%{$reset_color%}"
  fi
  # behind
  if $(echo "$_INDEX" | grep '^## .*behind' &> /dev/null); then
    _STATUS="$_STATUS%{$fg[magenta]%}▼%{$reset_color%}"
  fi
  # diverged
  if $(echo "$_INDEX" | grep '^## .*diverged' &> /dev/null); then
    _STATUS="$_STATUS%{$fg_bold[red]%}≠%{$reset_color%}"
  fi

  echo $_STATUS
}

git_prompt () {
  local _result=""
  local _branch=$(git_branch)
  if [ "${_branch}" ]; then
    _result="[%{$fg[white]%}$_branch"
    local _status=$(git_status)
    if [ "${_status}" ]; then
      _result="$_result $_status"
    fi
    _result="$_result%{$reset_color%}]"
  fi
  echo $_result
}

autoload -Uz git_branch git_status git_prompt

if [[ $EUID -eq 0 ]]; then
  _USERNAME="%{$fg_bold[red]%}%n%{$reset_color%}@%m"
  _PROMPT="%{$fg[red]%}#"
else
  _USERNAME="%{$fg_bold[white]%}%n%{$reset_color%}@%m"
  _PROMPT="%{$fg[green]%}$"
fi

setopt prompt_subst
PROMPT="$_USERNAME %{$fg_bold[white]%}%~%{$reset_color%}
$_PROMPT%{$reset_color%} "

N="%{$fg_bold[white]%}N%{$reset_color%}"
I="%{$fg[yellow]%}I%{$reset_color%}"

function zle-keymap-select {
    mode="${${KEYMAP/vicmd/${N}}/(main|viins)/${I}}"
    zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish { mode=$I }
zle -N zle-line-finish

RPROMPT='$(git_prompt)[${mode}]'
