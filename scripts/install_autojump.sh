#! /bin/bash
#
# Author : Yingcheng Liu
# Email  : liuyc@mit.edu
# Date   : 01/08/2022
#
# Distributed under terms of the MIT license.
#

if command -v autojump &> /dev/null
then
    echo "autojump already installed."
else
    if ! command -v cargo &> /dev/null
    then
        echo "cargo not installed."
        exit
    fi
    echo "installing autojump"
    cargo install autojump
fi
