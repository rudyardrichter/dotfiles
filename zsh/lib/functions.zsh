function zsh_stats() {
    fc -l 1 | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n30
}

function aes-encrypt() {
    target="$1.aes"
    openssl aes-128-cbc -salt -in $1 -out $target
}

function aes-decrypt() {
    tarball="${$(basename $1)%.*}"
    openssl aes-128-cbc -d -in $1 -out $tarball
}

function backup() {
    filename="${$(basename $1)%.*}"
    tarball="$filename.tar.gz"
    tar czf $tarball $1
    aes-encrypt $tarball
    rm $tarball
}

function gclmy() {
    git clone --recursive git@github.com:rudyardrichter/$1.git
}

function ggb() {
    git log --graph --pretty=$pretty_fmt --first-parent $(git rev-parse $(git merge-base master HEAD))..HEAD
}

function ghl() {
    git checkout $1 && git pull
}

function union() {
    cat $1 $2 | sort | uniq
}

function intersection() {
    cat $1 $2 | sort | uniq -d
}

function difference() {
    cat $1 $2 $2 | sort | uniq -u
}

function mkcd() {
    mkdir -p $1
    cd $1
}

function extract() {
    if [ -z "$1" ]; then
        echo "usage: extract file.(zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz)"
    else
        if [ -f $1 ] ; then
            case $1 in
                *.tar.bz2)    tar xvjf $1    ;;
                *.tar.gz)     tar xvzf $1    ;;
                *.tar.xz)     tar xvJf $1    ;;
                *.lzma)       unlzma $1      ;;
                *.bz2)        bunzip2 $1     ;;
                *.rar)        unrar x -ad $1 ;;
                *.gz)         gunzip $1      ;;
                *.tar)        tar xvf $1     ;;
                *.tbz2)       tar xvjf $1    ;;
                *.tgz)        tar xvzf $1    ;;
                *.zip)        unzip $1       ;;
                *.Z)          uncompress $1  ;;
                *.7z)         7z x $1        ;;
                *.xz)         unxz $1        ;;
                *.exe)        cabextract $1  ;;
                *)            echo "extract: unknown archive method: $1" ;;
            esac
        else
            echo "$1 does not exist"
        fi
    fi
}

function csv_to_github_table() {
    sed -r 's/(\S),(\S)/\1 | \2/g; s/^(.*)$/| \1 |/; 1s/(.*)/\1\n\1/' $1 |
    tr -d '"' |
    column -t |
    sed '2s/| /|:/g; 2s/[^|:]/-/g; 2s/| /|:/g; 2s/ //g'
}

function scut() {
    cut -d ' ' -f $1 $2
}

function autopep8diff() {
    pepped="${1%.*}.autopep8-corrected.py"
    autopep8 $1 > $pepped
    nvim -d $1 $pepped
    rm $pepped
}

function rgl() {
    rg --heading --color=always "$@" | less
}

function re() {
    rg -l "$@" | xargs nvim
}

# colorscheme
function cs() {
    export COLORSCHEME="$1"
    dynamic-colors switch "$1"
}

function psg() {
    ps aux | grep -E "($@|^\s*USER)" | grep -v grep
}

function fe() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

function find_up() {
    setopt localoptions null_glob
    result=((../)#"$@"(:a))
    if [[ -n $result ]]; then
        echo $result
    fi
}

function globus-mfa-users () {
  AWS_PROFILE=rudyard ADMIN_AWS_MFA_SN=arn:aws:iam::942379385228:mfa/rudyard \
    $HOME/.envs/globus/bin/mfa-login --mmin 540 "$HOME/.globus_mfa_users" || return $?
  $HOME/.envs/globus/bin/mfa-to-profile mfa-activated "$HOME/.globus_mfa_users"
}

function mkpyd() {
    mkdir "$1"
    touch "$1/__init__.py"
}
