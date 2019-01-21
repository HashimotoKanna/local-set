#ZSH_THEME="dst"
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

# disable Software Flow Control (XON/XOFF flow control)
stty -ixon
# battery info
RPROMPT='$(battery_pct_prompt)'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/kanna/.sdkman"
[[ -s "/home/kanna/.sdkman/bin/sdkman-init.sh" ]] && source "/home/kanna/.sdkman/bin/sdkman-init.sh"

tmux
