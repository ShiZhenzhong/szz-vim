#!/bin/bash

mv ~/.vimrc ~/.vimrc.bak
mv ~/.vim ~/.vim.bak
cp ./vimrc ~/.vimrc
cp -r ./vim ~/.vim
echo "Done..."
