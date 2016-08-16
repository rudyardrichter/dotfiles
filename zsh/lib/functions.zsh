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

function gclmy() {
    git clone --recursive git@github.com:rudyardrichter/$1.git
}
