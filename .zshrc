export TERM="xterm-256color"
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="cdimascio-lambda"
source $ZSH/oh-my-zsh.sh
stty -ixon
source ~/.aliases
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
