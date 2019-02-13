#!/bin/bash

# update package list and update package
echo "#######################################################"
echo "# update and upgrade ubuntu packages                  #"
echo "#######################################################"
sudo apt update && sudo apt upgrade -y
sudo apt install -y git tmux vim gdb curl zsh fonts-powerline
curl -sL https://deb.nodesource.com/setup_10.x | sudo bash -
sudo apt install -y nodejs

# install zsh and change default shell as zsh
echo "#######################################################"
echo "# install zsh and change shell as zsh                 #"
echo "#######################################################"
# sudo apt install zsh -y 
chsh -s $(which zsh)
# install oh-my-zsh
echo "#######################################################"
echo "# install oh-my-zsh                                   #"
echo "#######################################################"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
git clone https://github.com/denysdovhan/spaceship-prompt.git "$HOME/.oh-my-zsh/custom/themes/spaceship-prompt"
# ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
ln -s "$HOME/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme" "$HOME/.oh-my-zsh/custom/themes/spaceship.zsh-theme"

echo "# Load custom aliases" >> $HOME/.zshrc
echo "[[ -s "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"" >> $HOME/.zshrc
echo "plugins=(" >> $HOME/.zshrc
echo "  colored-man-pages" >> $HOME/.zshrc
echo "  colorize" >> $HOME/.zshrc
echo "  battery" >> $HOME/.zshrc
echo "  z" >> $HOME/.zshrc
echo "  zsh-autosuggestions" >> $HOME/.zshrc
echo ")" >> $HOME/.zshrc
echo "# disable Software Flow Control (XON/XOFF flow control)" >> $HOME/.zshrc
echo "stty -ixon" >> $HOME/.zshrc
echo "# battery info" >> $HOME/.zshrc
echo "RPROMPT='$(battery_pct_prompt)'" >> $HOME/.zshrc
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
# sudo apt install tmux -y
# set tmux configuration
[ -f $HOME/.tmux.conf ] && cat dotfiles/.tmux.conf >> ~/.tmux.conf || cp dotfiles/.tmux.conf ~/.tmux.conf

# install or update vim
# sudo apt install vim -y
# install vim Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# set vim configuration
[ -f $HOME/.vimrc ] && cat dotfiles/.vimrc >> ~/.vimrc || cp dotfiles/.vimrc ~/.vimrc
# download jellybean awesome color theme
curl https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim -o ~/.vim/colors/jellybeans.vim --create-dir
# source .vimrc
# vim -c PluginInstall

# install gdb-gef
wget -q -O- https://github.com/hugsy/gef/raw/master/scripts/gef.sh | sh
# install gdb pwndbg
 git clone https://github.com/pwndbg/pwndbg && cd pwndbg && ./setup.sh && cd ..
# set gdb configuration
[ -f $HOME/.gdbinit ] && cat dotfiles/.gdbinit >> ~/.gdbinit || cp dotfiles/.gdbinit ~/.gdbinit