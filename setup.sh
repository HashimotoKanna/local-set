#!/bin/bash

# update package list and update package
sudo apt update && sudo apt upgrade -y

# install zsh
sudo apt install zsh
# change default shell as zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#echo "# Load custom aliases" >> $HOME/.zshrc
#echo "[[ -s "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"" >> $HOME/.zshrc
#echo " ZSH_THEME="dst"" >> $HOME/.zshrc
#echo "HIST_STAMPS="mm/dd/yyyy"" >> $HOME/.zshrc
#echo "plugins=(" >> $HOME/.zshrc
#echo "  colored-man-pages" >> $HOME/.zshrc
#echo "  colorize" >> $HOME/.zshrc
#echo "  battery" >> $HOME/.zshrc
#echo "  themes" >> $HOME/.zshrc
#echo "  z" >> $HOME/.zshrc
#echo ")" >> $HOME/.zshrc
#echo "# disable Software Flow Control (XON/XOFF flow control)" >> $HOME/.zshrc
#echo "stty -ixon" >> $HOME/.zshrc
#echo "# battery info" >> $HOME/.zshrc
#echo "RPROMPT='$(battery_pct_prompt)'" >> $HOME/.zshrc
#echo "# Load NVM" >> $HOME/.zshrc
#echo "export NVM_DIR="$(realpath $HOME/.nvm)"" >> $HOME/.zshrc
#echo "[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm" >> $HOME/.zshrc
#echo "[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion" >> $HOME/.zshrc
#echo "#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!" >> $HOME/.zshrc
#echo "#export SDKMAN_DIR="/home/kanna/.sdkman"" >> $HOME/.zshrc
#echo "#[[ -s "/home/kanna/.sdkman/bin/sdkman-init.sh" ]] && source "/home/kanna/.sdkman/bin/sdkman-init.sh"" >> $HOME/.zshrc

# set git configuration
[ -f $HOME/.gitconfig ] && cat dotfiles/.gitconfig >> ~/.gitconfig || cp dotfiles/.gitconfig ~/.gitconfig
[ -f $HOME/.gitignore ] && cat dotfiles/.gitignore >> ~/.gitignore || cp dotfiles/.gitignore ~/.gitignore

# set alias
[ -f $HOME/.bash_aliases ] && cat dotfiles/.bash_aliases >> ~/.bash_aliases || cp dotfiles/.bash_aliases ~/.bash_aliases

# install tmux
sudo apt install tmux
# set tmux configuration
[ -f $HOME/.tmux.conf ] && cat dotfiles/.tmux.conf >> ~/.tmux.conf || cp dotfiles/.tmux.conf ~/.tmux.conf

# install vim Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# set vim configuration
[ -f $HOME/.vimrc ] && cat dotfiles/.vimrc >> ~/.vimrc || cp dotfiles/.vimrc ~/.vimrc
# download jellybean awesome color theme
curl https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim -o ~/.vim/colors/jellybeans.vim --create-dir
# source .vimrc
#vim -c PluginInstall

# install gdb
sudo apt install gdb
# install gdb gef
wget -q -O- https://github.com/hugsy/gef/raw/master/scripts/gef.sh | sh
# install gdb pwndbg
# git clone https://github.com/pwndbg/pwndbg && cd pwndbg && ./setup.sh && cd ..
# set gdb configuration
[ -f $HOME/.gdbinit ] && cat dotfiles/.gdbinit >> ~/.gdbinit || cp dotfiles/.gdbinit ~/.gdbinit

# install nvm
#LATEST_NODE=`nvm ls-remote | tail -n 1`
#nvm install $LATEST_NODE
#nvm default $LATEST_NODE
sudo npm install -g spaceship-prompt
