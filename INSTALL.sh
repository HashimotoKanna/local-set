cp dotfiles/.zshrc $HOME/
cp dotfiles/.vimrc $HOME/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
curl https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim -o ~/.vim/colors/jellybeans.vim --create-dir
cp dotfiles/.tmux.conf $HOME/
tmux source-file $HOME/.tmux.conf
cp dotfiles/.bash_aliases $HOME/
cp dotfiles/.gitignore $HOME/
cp dotfiles/.gitconfig $HOME/

#
# install oh my zsh
#
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo source ~/.bash_aliases >> $HOME/.zshrc

#
# install labmda zsh theme
#
git clone https://github.com/cdimascio/lambda-zsh-theme
cp lambda-zsh-theme/cdimascio-lambda.zsh-theme ~/.oh-my-zsh/themes
echo ZSH_THEME="cdimascio-lambda" >> $HOME/.zshrc

#
# install zsh autosuggestion
#
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh >> $HOME/.zshrc

#
# install exa
#
wget https://github.com/ogham/exa/releases/download/v0.8.0/exa-linux-x86_64-0.8.0.zip
unzip exa-linux-x86_64-0.8.0.zip
sudo mv exa-linux-x86_64 /usr/bin/exa

echo stty -ixon >> $HOME/.zshrc
