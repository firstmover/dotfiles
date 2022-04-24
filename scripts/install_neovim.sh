#!/bin/bash
#
# Author : Yingcheng Liu
# Email  : liuyc@mit.edu
# Date   : 01/08/2022
#
# Distributed under terms of the MIT license.
#

if command -v nvim &> /dev/null
then
    echo "nvim already installed."
else
    echo "installing neovim"

    TARGET_DIR=$HOME/.bin
    NVIM_URL="https://github.com/neovim/neovim/releases/download/v0.6.1/nvim.appimage"
    [ ! -d $TARGET_DIR ] && mkdir -p $TARGET_DIR
    cd $TARGET_DIR && { curl -OL $NVIM_URL ; cd -; }
    chmod u+x $TARGET_DIR/nvim.appimage
fi

python3 -m pip install pynvim

nvim.appimage +"PlugInstall" +qall
nvim.appimage +":CocInstall coc-pyright,coc-snippets" +qall
