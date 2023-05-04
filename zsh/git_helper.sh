#!/bin/zsh
set -e

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