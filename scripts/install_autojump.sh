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

# install bash/zsh executables
autojump_exe_dir="$HOME/.autojump/share/autojump"
echo $autojump_exe_dir
[ ! -d $autojump_exe_dir ] && mkdir -p $autojump_exe_dir
curl -o "$autojump_exe_dir/autojump.zsh" https://github.com/wting/autojump/blob/master/bin/autojump.zsh
curl -o "$autojump_exe_dir/autojump.bash" https://github.com/wting/autojump/blob/master/bin/autojump.bash
