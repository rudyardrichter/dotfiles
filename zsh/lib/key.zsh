bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^p' up-line-or-search
bindkey '^n' down-line-or-search
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' forward-word
bindkey '^b' backward-word
bindkey '^j' down-line-or-beginning-search
bindkey '^k' up-line-or-beginning-search
bindkey '^r' history-incremental-search-backward

bindkey -M vicmd v edit-command-line
bindkey -M vicmd k up-line-or-search
bindkey -M vicmd j down-line-or-search
bindkey -M vicmd H beginning-of-line
bindkey -M vicmd L end-of-line
# no delay between vi mode switches
set -s escape-time 0
export KEYTIMEOUT=1
