insecure_dirs=( ${(f@):-"$(compaudit 2>/dev/null)"} )
if (( ! ${#insecure_dirs} )) return
echo "Insecure completion-dependent directories detected:"
ls -ld "${(@)insecure_dirs}"
echo "For an easy fix, run:"
echo "    compaudit | xargs chmod g-w"
