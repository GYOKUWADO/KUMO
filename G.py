import requests
import json
import datetime

headers = {'X-Api-Key': 'ここに貴方のNewsApikeyを入れて下さい。'}

d_today = datetime.date.today()

date = d_today - datetime.timedelta(days=1)

#days=1の値を変更して何日前の情報を取得するかを指定


#print(date)


url = 'https://newsapi.org/v2/everything'
params = {
    'q': 'ガンダム',
    'from': date
}

#'q': 'ガンダム',の検索ワードを任意の文字に変更


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