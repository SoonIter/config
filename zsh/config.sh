#!/bin/zsh
set -e
source ./colors.sh
source ./git_helper.sh

# vpn clash
vpn(){
  export https_proxy=http://127.0.0.1:7890 
  export http_proxy=http://127.0.0.1:7890 
  export all_proxy=socks5://127.0.0.1:7890
} 

# alias
alias config="vim ~/.zshrc"
alias codes="cd ~/Documents/codes/"
alias demos="cd ~/Documents/demos/"
 
# zsh-vi
ZVM_VI_INSERT_ESCAPE_BINDKEY=jj
source /opt/homebrew/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# oh-my-zsh
plugins=(
  zsh-syntax-highlighting
  zsh-autosuggestions
)
source $ZSH/oh-my-zsh.sh

# starship
eval "$(starship init zsh)"

