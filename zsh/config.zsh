#!/bin/zsh
# ------------------------------------------------------------
# Colors
RED='\e[1;31m'
GREEN='\e[1;32m'
YELLOW='\e[1;33m'
BLUE='\e[1;34m'
PINK='\e[1;35m'
SKYBLUE='\e[1;96m'
RES='\e[0m'

function console.red {
    echo -en "${RED}$1${RES}"
}

function console.green {
    echo -en "${GREEN}$1${RES}"
}

function console.yellow {
    echo -en "${YELLOW}$1${RES}"
}

function console.blue {
    echo -en "${BLUE}$1${RES}"
}

function console.skyblue {
    echo -en "${SKYBLUE}$1${RES}"
}

function console.pink {
    echo -en "${PINK}$1${RES}"
}

# ------------------------------------------------------------
# git_helper
function get_main_branch {
    BRANCHES=$(git branch | sed -e "s/^[* ]*//g")
    if echo $BRANCHES | grep -q "main"; then
        echo "main"
    elif echo $BRANCHES | grep -q "master"; then
        echo "master"
    elif echo $BRANCHES | grep -q "dev"; then
        echo "dev"
    else
        console.red "No main or master branch found\n"
        return 1
    fi
}

function get_current_branch {
    git rev-parse --abbrev-ref HEAD
}

function get_upstream {
    if test -d .git/refs/remotes/upstream; then
        echo "upstream"
    elif test -d .git/refs/remotes/origin; then
        echo "origin"
    else
        console.red "No main or master branch found\n"
    fi
}

# ------------------------------------------------------------
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
 
# ------------------------------------------------------------
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
# ------------------------------------------------------------
