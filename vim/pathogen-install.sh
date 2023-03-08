#!/bin/bash

if [ -f ~/.vim/autoload/pathogen.vim ]
then
    PREVDIR="$(pwd)"
    export PREVDIR
    echo "What is the url for the plugin you'd like to install?"
    read -rp "-> " repo
    cd ~/.vim/bundle || return
    git clone "$repo"
    cd "$(ls -t | head -n 1)" || exit
    git submodule update --init --recursive 
    cd "$PREVDIR" || return
else
    echo "I couldn't find pathogen, installing it now!"
    mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
    echo "execute pathogen#infect()" >> ~/.vimrc
    echo "syntax on" >> ~/.vimrc
    echo "filetype plugin indent on" >> ~/.vimrc
    vim -c "source ~/.vimrc"
fi
