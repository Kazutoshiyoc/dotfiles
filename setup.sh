#!/bin/bash

# copy .vimrc file to home dir
cp .vimrc ~/

# git settings
git config --global diff.tool vimdiff
git config --global difftool.prompt false
git config --global alias.st status
