import requests
import json

base_url = "https://api.github.com/users/mateusfg7/repos"

response = requests.get(base_url)
response_json = response.json()

def save_to_file(file_name, data):
    with open(file_name, 'a') as file:
        file.write(f'{data}\n')

for repo in response_json:
    save_to_file('github-repos.txt', repo["html_url"])
    print(f'{repo["html_url"]}')
