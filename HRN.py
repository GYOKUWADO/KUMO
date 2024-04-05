import requests
import json

headers = {'X-Api-Key': 'NEWS API KEYを入れて下さい。'}

url = 'https://newsapi.org/v2/top-headlines'
params = {
    'category': 'business',
    'country': 'jp'
}

# Get response
response = requests.get(url, headers=headers, params=params)
print(response)

#print(response.json())

if response.ok:
   data = response.json()
   print('totalResults:', data['totalResults'])
   for num in range(20):
       print('articles:',num,'\n[source]id:',data['articles'][num]['source']['id'],'name:',data['articles'][num]['source']['name'],'\nauthor:',data['articles'][num]['author'],'\ntitle:',data['articles'][num]['title'],'\nurl:',data['articles'][num]['url'],'\npublishedAt:',data['articles'][num]['publishedAt'],'\n----------------------------------------------------------------------------------')

"""
data = response.json()
print(json.dumps(data, indent=2 , ensure_ascii = False))
"""