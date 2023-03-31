#!/bin/bash
DF_REL_PATH="`dirname \"$0\"`"
DF_SCRIPT_PATH="`( cd \"$REL_PATH\" && pwd )`"

function symlink_home {
    if [[ -e ~/$1 ]]; then
        echo "Skipping $1"
    else
        echo "Setting up $1"
        ln -s $DF_SCRIPT_PATH/$1 ~/
    fi
}

symlink_home .gitconfig
symlink_home .vimrc
symlink_home .vim
symlink_home .tmux.conf

