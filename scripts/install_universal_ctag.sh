#! /bin/bash
#
# Author : Yingcheng Liu
# Email  : liuyc@mit.edu
# Date   : 01/08/2022
#
# Distributed under terms of the MIT license.
#
TARGET_DIR="$HOME/.local/src"
[ ! -d $TARGET_DIR ] && mkdir -p $TARGET_DIR
cd $TARGET_DIR
git clone https://github.com/universal-ctags/ctags.git
cd ctags
bash autogen.sh
bash configure --prefix=$HOME/.local
make -j8
make install
