git_branch () {
  ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  echo "${ref#refs/heads/}"
}

git_status () {
  _INDEX=$(command git status --porcelain -b 2> /dev/null)
  _STATUS=""
  # staged
  if $(echo "$_INDEX" | grep '^[AMRD]. ' &> /dev/null); then
    _STATUS="$_STATUS%{$fg[green]%}●%{$reset_color%}"
  fi
  # unstaged
  if $(echo "$_INDEX" | grep '^.[MTD] ' &> /dev/null); then
    _STATUS="$_STATUS%{$fg[yellow]%}●%{$reset_color%}"
  fi
  # untracked
  if $(echo "$_INDEX" | command grep -E '^\?\? ' &> /dev/null); then
    _STATUS="$_STATUS%{$fg[red]%}●%{$reset_color%}"
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
  if [[ "${_branch}x" != "x" ]]; then
    _result="[%{$fg[white]%}$_branch"
    local _status=$(git_status)
    if [[ "${_status}x" != "x" ]]; then
      _result="$_result $_status"
    fi
    _result="$_result%{$reset_color%}]"
  fi
  echo $_result
}

if [[ $EUID -eq 0 ]]; then
  _USERNAME="%{$fg_bold[red]%}%n%{$reset_color%}@%m"
  _PROMPT="%{$fg[red]%}#"
else
  _USERNAME="%{$fg_bold[white]%}%n%{$reset_color%}@%m"
  _PROMPT="%{$fg[green]%}$"
fi

setopt prompt_subst
PROMPT="$_PROMPT%{$reset_color%} "

# username and path
_LEFT="$_USERNAME %{$fg_bold[white]%}%~%{$reset_color%}"
# timestamp
_RIGHT="%* "

arete_precmd () {
  local STR=$_LEFT$_RIGHT
  local zero='%([BSUbfksu]|([FB]|){*})'
  local LENGTH=${#${(S%%)STR//$~zero/}}
  local SPACES=""
  (( LENGTH = ${COLUMNS} - $LENGTH - 1 ))

  for i in {0..$LENGTH}
    do
      SPACES="$SPACES "
    done

  print -rP "$_LEFT$SPACES$_RIGHT"
}

N="%{$fg_bold[white]%}N%{$reset_color%}"
I="%{$fg[yellow]%}I%{$reset_color%}"

function zle-keymap-select {
    mode="${${KEYMAP/vicmd/${N}}/(main|viins)/${I}}"
    zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
    mode=$I
}
zle -N zle-line-finish

RPROMPT='$(git_prompt)[${mode}]'

autoload -Uz git_branch
autoload -Uz git_status
autoload -Uz git_prompt
autoload -Uz add-zsh-hook
add-zsh-hook precmd arete_precmd
