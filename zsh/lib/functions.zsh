function zsh_stats() {
  fc -l 1 | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n20
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

function extract {
    if [ -z "$1" ]; then
        echo "usage: extract file.(zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz)"
    else
        if [ -f $1 ] ; then
            case $1 in
                *.tar.bz2)    tar xvjf ../$1    ;;
                *.tar.gz)     tar xvzf ../$1    ;;
                *.tar.xz)     tar xvJf ../$1    ;;
                *.lzma)       unlzma ../$1      ;;
                *.bz2)        bunzip2 ../$1     ;;
                *.rar)        unrar x -ad ../$1 ;;
                *.gz)         gunzip ../$1      ;;
                *.tar)        tar xvf ../$1     ;;
                *.tbz2)       tar xvjf ../$1    ;;
                *.tgz)        tar xvzf ../$1    ;;
                *.zip)        unzip ../$1       ;;
                *.Z)          uncompress ../$1  ;;
                *.7z)         7z x ../$1        ;;
                *.xz)         unxz ../$1        ;;
                *.exe)        cabextract ../$1  ;;
                *)            echo "extract: unknown archive method: $1" ;;
            esac
        else
            echo "$1 does not exist"
        fi
    fi
}
