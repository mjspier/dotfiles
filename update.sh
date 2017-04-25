#!/bin/bash

printf "Git pull dotfiles \n"
echo "==================="
git pull
printf "Git pull vim plugins\n"
echo "==================="
cd $PWD/.vim/bundle
for d in * ; do
    echo "update : $d"
    cd "$d"
    git pull
    cd ..
done
printf " done\n"
