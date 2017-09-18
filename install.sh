#!/bin/bash
printf "Clone submodules ..."
git submodule update --init --recursive
printf " done\n"

printf "Install links ..."
ln -s -f $PWD/.i3 $HOME
ln -s -f $PWD/.i3/.i3status.conf $HOME
ln -s -f $PWD/.vimrc $HOME
ln -s -f $PWD/.vim $HOME
 ln -s -f $PWD/.zshrc $HOME
 ln -s -f $PWD/.zsh $HOME
ln -s -f $PWD/.Xmodmap $HOME
ln -s -f $PWD/.bin $HOME
printf " done\n"
