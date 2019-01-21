export ZSH="/home/kanna/.oh-my-zsh"
export PATH=$PATH:$HOME/android-studio/bin
export PATH=$PATH:$HOME/script
export JAVA_HOME=/usr/lib/jvm/java-1.11.0-openjdk-amd64
export CLASSPATH=$CLASSPATH:.

ZSH_THEME="dst"
HIST_STAMPS="mm/dd/yyyy"
plugins=(
  git
  web-search
  colored-man-pages
  colorize
  command-not-found
  #compleat
  fbterm
  battery
  rand-quote
  copydir
  themes
)

source $ZSH/oh-my-zsh.sh

# disable Software Flow Control (XON/XOFF flow control)
stty -ixon

[[ -s "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"

RPROMPT='$(battery_pct_prompt)'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/kanna/.sdkman"
[[ -s "/home/kanna/.sdkman/bin/sdkman-init.sh" ]] && source "/home/kanna/.sdkman/bin/sdkman-init.sh"

tmux
