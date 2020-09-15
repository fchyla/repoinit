#!/bin/bash
repoinit () {

    git init
    git-crypt init
    touch .gitignore .gitattributes
    echo "# Syntax
# secretfile filter=git-crypt diff=git-crypt
# *.key filter=git-crypt diff=git-crypt" >> .gitattributes
    git flow init -d
}

repoinit

