#!/bin/bash

# copy .vimrc file to home dir
cp .vimrc ~/

# copy Neovim configration file
mkdir -p ~/.config/nvim
cp .vimrc ~/.config/nvim/init.vim

# git settings
git config --global diff.tool vimdiff
git config --global difftool.prompt false
git config --global alias.st status
