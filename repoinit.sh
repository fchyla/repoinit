#!/bin/bash

add_pre_commit_check () {

detect-secrets scan > .secrets.baseline
echo "repos:
- repo: https://github.com/Yelp/detect-secrets.git
  rev: v0.14.3
  hooks:
  - id: detect-secrets
    args: ['--baseline', '.secrets.baseline']
    exclude: .*/tests/.*" >> .pre-commit-config.yaml
}

add_gitignore() {
    echo ".pre-commit-config.yaml
    .secrets.baseline" >> .gitignore
}

add_gitattributes() {

    echo "# Syntax
# secretfile filter=git-crypt diff=git-crypt
# *.key filter=git-crypt diff=git-crypt" >> .gitattributes

}
repoinit () {

    git init
    git-crypt init

    add_pre_commit_check
    add_gitignore
    add_gitattributes

    git flow init -d
}

repoinit

