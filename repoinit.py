#!/usr/local/bin/python3

import configparser
import sys
import requests
import json

project_name = sys.argv[1]

config = configparser.ConfigParser()
config.read('./repoinit.config')

repo_key = config['GH']['K1'] #import gh key
token = 'token ' + repo_key

github_auth_header = {'Authorization': token}
github_api_url = "https://api.github.com"

gh_repos_api = github_api_url + "/user/repos"

r = requests.get(gh_repos_api, headers=github_auth_header)

parsed = json.loads(r.text)

for i in range(0, len(parsed)):
    if project_name in parsed[i]["name"]:
        sys.exit("Repository "+project_name+" exists")
    
print("Creating "+project_name)

create_repo_payload = { 
        "name": project_name,
        }

# data in post converted to json
create_repo = requests.post(gh_repos_api, headers=github_auth_header, data=json.dumps(create_repo_payload))

parsed = json.loads(create_repo.text)


# check select+get_key vs get_key+select
keys = ["ssh_url", "clone_url"]
url_list = []
for x in keys:
    url_list.append(parsed[x])
    

