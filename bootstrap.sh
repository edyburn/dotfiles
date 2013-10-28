#!/bin/bash
DF_REL_PATH="`dirname \"$0\"`"
DF_SCRIPT_PATH="`( cd \"$REL_PATH\" && pwd )`"

function symlink_home {
    # creates a symlink in the home directory
    #   the first parameter is the target path relative to the script
    #   the second (optional) parameter is a path where to place the symlink
    ln -si $DF_SCRIPT_PATH/$1 ~/$2
}

function mkdir_home {
    # creates a directory in the home directory
    #   the first parameter is the directory to create relative to $HOME
    mkdir -p ~/$1
}

function copy_home {
    # copies a file to the home directory
    #   the first parameter is the target relative to the script
    #   the second (optional) parameter is a path where to place the copy
    cp $DF_SCRIPT_PATH/$1 ~/$2
}

function prompt_and_replace {
    REPLY=""
    read -p "$1"
    sed -i s/"$2"/"$REPLY"/ $3

}

echo "Setting up git"
# check if file exists
if [[ -e ~/.gitconfig ]]; then
    echo "Replace .gitconfig?"
    select df_select in "Yes" "No"; do
        case $df_select in
            Yes ) DF_INSTALL=true; break;;
            * ) DF_INSTALL=false; break;;
        esac
    done
else
    DF_INSTALL=true
fi
if [[ "$DF_INSTALL" == "true" ]]; then
    # copy template
    copy_home .gitconfig
    # fill in username
    prompt_and_replace "Enter username for git: " "\\\$GITUSERNAME" "$HOME/.gitconfig"
    # fill in email
    prompt_and_replace "Enter email for git: " "\\\$GITEMAIL" "$HOME/.gitconfig"
fi

echo "Setting up vim"
symlink_home ".vim"
symlink_home ".vimrc"

echo "Setting up pip"
mkdir_home ".pip"
symlink_home ".pip/pip.conf" ".pip"

echo "Setting up tmux"
symlink_home ".tmux.conf"

