set cole=2

syntax match hsNiceOperator "\\\ze[[:alpha:][:space:]_([]" conceal cchar=λ

hi link hsNiceOperator Operator
hi! link Conceal Operator
