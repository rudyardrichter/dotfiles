typeset -Ag abbreviations
abbreviations=(
    "AG"    "| agrep"
    "EG"    "| egrep"
    "G"     "| grep"
    "H"     "| head"
    "M"     "| map"
    "S"     "| sed"
    "T"     "| tail"
    "U"     "| uniq"
    "W"     "| wc"
    "X"     "| xargs"
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

zle -N        magic-abbrev-expand
zle -N        no-magic-abbrev-expand
bindkey " "   magic-abbrev-expand
bindkey "^x " no-magic-abbrev-expand
bindkey -M isearch " " self-insert