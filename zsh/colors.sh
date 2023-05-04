#!/bin/zsh
set -e
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


