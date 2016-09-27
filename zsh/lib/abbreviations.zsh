typeset -Ag abbreviations
abbreviations=(
    'EG'    '| egrep'
    'G'     '| grep'
    'C'     '| cut'
    'H'     '| head'
    'L'     '| less'
    'M'     '| map'
    'P'     '|'
    'QLOG'  '> "Q$(date +%FT%R).log"'
    'S'     '| sed'
    'T'     '| tail'
    'U'     '| uniq'
    'W'     '| wc -l'
    'X'     '| xargs'
)

magic-abbrev-expand() {
    local MATCH
    LBUFFER=${LBUFFER%%(#m)[_a-zA-Z0-9]#}
    LBUFFER+=${abbreviations[$MATCH]:-$MATCH}
    zle self-insert
}

no-magic-abbrev-expand() {
    LBUFFER+=' '
}

zle -N magic-abbrev-expand
zle -N no-magic-abbrev-expand
bindkey ' ' magic-abbrev-expand
bindkey '^x ' no-magic-abbrev-expand
bindkey -M isearch ' ' self-insert
