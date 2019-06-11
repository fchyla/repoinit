#!/bin/bash
PROJECTS_DIR="$HOME/projects"

repoinit () {

    if [[ $# -eq 0 ]] ; then
        echo 'Missing project directory name, usage:'
        echo 'repoinit <project_name>'
        exit 0
    fi

    if [ ! -d "$PROJECTS_DIR" ]; then
        echo "Created projects dir: $PROJECTS_DIR"
        mkdir $PROJECTS_DIR
    fi

    cd $PROJECTS_DIR


    if [ -d "$1" ]; then
        echo "$1 directory exists, select a different name"
        exit 0
    fi
    mkdir -p $1
    echo "Created $1"

    cd $1
    git init
    git-crypt init
    touch .gitignore .gitattributes
    echo "# Syntax
# secretfile filter=git-crypt diff=git-crypt
# *.key filter=git-crypt diff=git-crypt" >> .gitattributes

}

repoinit $1