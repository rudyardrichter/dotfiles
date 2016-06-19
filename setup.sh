#!/bin/bash

d=~/dotfiles
d_old=~/dotfiles_old
files="vimrc zsh zshrc"

echo "Making backup directory for old dotfiles at $d_old."
mkdir -p $d_old
echo "cd-ing to $d."
cd $d
echo "Moving old dotfiles to backup directory and symlinking dotfiles:"
for file in $files; do
    echo "    $file"
    mv ~/.$file $d_old/ 2> /dev/null
    ln -s $d/$file ~/.$file
done
