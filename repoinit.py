#!/usr/local/bin/python3


import configparser
from github import Github

config = configparser.ConfigParser()
config.read('repoinit.config')

repo_key = config['GH']['K1'] #import gh key

request = Github(repo_key)

for repo in request.get_user().get_repos():
    print(repo.name)