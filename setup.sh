#!/bin/bash

# update package list and update package
sudo apt update && sudo apt upgrade -y

# install zsh
sudo apt install zsh
# change default shell as zsh
chsh -s $(which zsh)
# install zsh-antigen (zsh package manage)
CMD_INSTALL_ANTIGEN="[ ! -f $HOME/antigen.zsh ] && curl -L git.io/antigen > $HOME/antigen.zsh"
echo "# install antigen."
echo $CMD_INSTALL_ANTIGEN >> $HOME/.zshrc
$CMD_INSTALL_ANTIGEN
CMD_SOURCE_ANTIGEN="source $HOME/antigen.zsh"
echo "# source antigen." >> $HOME/.zshrc
echo $CMD_SOURCE_ANTIGEN >> $HOME/.zshrc
$CMD_SOURCE_ANTIGEN
# set .zshrc
sudo npm install -g spaceship-prompt
echo "# Load the oh-my-zsh's library." >> $HOME/.zshrc
echo "antigen use oh-my-zsh" >> $HOME/.zshrc
echo "# Load the theme" >> $HOME/.zshrc
echo "# antigen theme https://github.com/denysdovhan/spaceship-zsh-theme spaceship" >> $HOME/.zshrc
echo "# Bundles from the default repo (robbyrussell's oh-my-zsh)." >> $HOME/.zshrc
echo "antigen bundle zsh-users/zsh-autosuggestions" >> $HOME/.zshrc
echo "antigen bundle z" >> $HOME/.zshrc
echo "# NVM bundle" >> $HOME/.zshrc
echo "export NVM_LAZY_LOAD=true" >> $HOME/.zshrc
echo "antigen bundle lukechilds/zsh-nvm" >> $HOME/.zshrc
echo "antigen bundle Sparragus/zsh-auto-nvm-use" >> $HOME/.zshrc
echo "# Syntax highlighting bundle." >> $HOME/.zshrc
echo "antigen bundle zsh-users/zsh-syntax-highlighti" >> $HOME/.zshrcng
echo "# Tell Antigen that you're done." >> $HOME/.zshrc
echo "antigen apply" >> $HOME/.zshrc
echo "# Load custom aliases" >> $HOME/.zshrc
echo "[[ -s "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"" >> $HOME/.zshrc
echo "# ZSH_THEME="dst"" >> $HOME/.zshrc

echo "#ZSH_THEME="dst"" >> $HOME/.zshrc
echo "HIST_STAMPS="mm/dd/yyyy"" >> $HOME/.zshrc
echo "plugins=(" >> $HOME/.zshrc
echo "  colored-man-pages" >> $HOME/.zshrc
echo "  colorize" >> $HOME/.zshrc
echo "  battery" >> $HOME/.zshrc
echo "  themes" >> $HOME/.zshrc
echo ")" >> $HOME/.zshrc
echo "# disable Software Flow Control (XON/XOFF flow control)" >> $HOME/.zshrc
echo "stty -ixon" >> $HOME/.zshrc
echo "# battery info" >> $HOME/.zshrc
echo "RPROMPT='$(battery_pct_prompt)'" >> $HOME/.zshrc
echo "# Load NVM" >> $HOME/.zshrc
echo "export NVM_DIR="$(realpath $HOME/.nvm)"" >> $HOME/.zshrc
echo "[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm" >> $HOME/.zshrc
echo "[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion" >> $HOME/.zshrc
echo "#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!" >> $HOME/.zshrc
echo "#export SDKMAN_DIR="/home/kanna/.sdkman"" >> $HOME/.zshrc
echo "#[[ -s "/home/kanna/.sdkman/bin/sdkman-init.sh" ]] && source "/home/kanna/.sdkman/bin/sdkman-init.sh"" >> $HOME/.zshrc

# install git
sudo apt install git
# get dotfiles
git clone https://github.com/aplgz/dotfiles
# set git configuration
[ -f $HOME/.gitconfig] && cat dotfiles/.gitconfig >> ~/.gitconfig || cp dotfiles/.gitconfig ~/.gitconfig
[ -f $HOME/.gitignore] && cat dotfiles/.gitignore >> ~/.gitignore || cp dotfiles/.gitignore ~/.gitignore

# set alias
[ -f $HOME/.bash_aliases] && cat dotfiles/.bash_aliases >> ~/.bash_aliases || cp dotfiles/.bash_aliases ~/.bash_aliases

# install tmux
sudo apt install tmux
# set tmux configuration
[ -f $HOME/.tmux.conf] && cat dotfiles/.tmux.conf >> ~/.tmux.conf || cp dotfiles/.tmux.conf ~/.tmux.conf

# install vim Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# set vim configuration
[ -f $HOME/.vimrc] && cat dotfiles/.vimrc >> ~/.vimrc || cp dotfiles/.vimrc ~/.vimrc
# download jellybean awesome color theme
curl https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim -o ~/.vim/colors/jellybeans.vim --create-dir
# source .vimrc
vim -c PluginInstall

# install gdb
sudo apt install gdb
# install gdb gef
wget -q -O- https://github.com/hugsy/gef/raw/master/scripts/gef.sh | sh
# install gdb pwndbg
# git clone https://github.com/pwndbg/pwndbg && cd pwndbg && ./setup.sh && cd ..
# set gdb configuration
[ -f $HOME/.gdbinit] && cat dotfiles/.gdbinit >> ~/.gdbinit || cp dotfiles/.gdbinit ~/.gdbinit

# install nvm
LATEST_NODE=`nvm ls-remote | tail -n 1`
nvm install $LATEST_NODE
nvm default $LATEST_NODE

# install brew (linux wrapper)
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
#test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
#test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
#test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
#echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
#brew install bat
