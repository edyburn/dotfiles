#!/bin/bash

echo "Setting up vim"
ln -si ~/.dotfiles/.vim ~/
ln -si ~/.dotfiles/.vimrc ~/

echo "Setting up pip"
mkdir -p ~/.pip
ln -si ~/.dotfiles/.pip/pip.conf ~/.pip/

echo "Setting up tmux"
ln -si ~/.dotfiles/.tmux.com ~/

