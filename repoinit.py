#!/usr/local/bin/python3

import configparser
import sys
import requests
import json

#project_name = sys.argv[1]
project_name = "plugin-rocketchat"

config = configparser.ConfigParser()
config.read('./repoinit.config')

repo_key = config['GH']['K1'] #import gh key
token = 'token ' + repo_key

github_auth_header = {'Authorization': token}
github_api_url = "https://api.github.com/user/repos"


r = requests.get(github_api_url, headers=github_auth_header)

parsed = json.loads(r.text)

for i in range(0, len(parsed)):
    if project_name in parsed[i]["name"]:
        sys.exit("Repository "+project_name+" exists")
    
print("Creating "+project_name)

