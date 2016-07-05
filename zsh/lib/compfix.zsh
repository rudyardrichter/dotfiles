audit="$(compaudit 2>/dev/null)"
insecure_dirs=( ${(f@):-$audit} )
if [[ -z $audit ]] return
echo "Insecure completion-dependent directories detected:"
ls -ld "${(@)insecure_dirs}"
echo "For an easy fix, run:"
echo "    compaudit | xargs chmod g-w"
