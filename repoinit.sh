#!/bin/bash
PROJECTS_DIR="$HOME/projects"
WORK_DIR=$(dirname $(readlink -n $(which repoinit)))
PROJECT_NAME=$1
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


    if [ -d "$PROJECT_NAME" ]; then
        echo "$PROJECT_NAME directory exists, select a different name"
        exit 0
    fi
    mkdir -p $PROJECT_NAME
    echo "Created $PROJECT_NAME"

    cd $PROJECT_NAME
    git init
    git-crypt init
    touch .gitignore .gitattributes
    echo "# Syntax
# secretfile filter=git-crypt diff=git-crypt
# *.key filter=git-crypt diff=git-crypt" >> .gitattributes

    cd $WORK_DIR
    python3 repoinit.py $PROJECT_NAME
}

repoinit $1
