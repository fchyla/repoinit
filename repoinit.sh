#!/bin/bash
repoinit () {

    [ -n "$1" ] $$ mkdir -p $1
    git init
    git-crypt init
    touch .gitignore .gitattributes
    echo "# Syntax
# secretfile filter=git-crypt diff=git-crypt
# *.key filter=git-crypt diff=git-crypt" >> .gitattributes
    git flow init -d
}

repoinit
