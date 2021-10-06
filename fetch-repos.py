import requests
import re
import json

base_url = "https://api.github.com/users/mateusfg7/repos"

response = requests.get(base_url)
response_json = response.json()

def save_to_file(file_name, data):
    with open(file_name, 'a') as file:
        file.write(f'{data}\n')

for repo in response_json:
    regex = "(?<=https:\/\/github.com\/mateusfg7\/).*"
    repo_name = re.findall(regex, repo["html_url"])
    
    save_to_file('github-repos.txt', repo_name[0])
    
    print(repo_name[0])
