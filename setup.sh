#!/bin/bash
# install vim Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# install gdb gef
wget -q -O- https://github.com/hugsy/gef/raw/master/scripts/gef.sh | sh
# install gdb pwndbg
git clone https://github.com/pwndbg/pwndbg && cd pwndbg && ./setup.sh && cd ..
