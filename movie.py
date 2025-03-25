import requests
import json
from pprint import pprint
import get_movie_info
import webbrowser
import sys
import io

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8')

api = get_movie_info.TMDB("APIリードアクセストークン")

# APIキーを指定
api_key = "APIキー"
# APIのURLを生成
url = "https://api.themoviedb.org/3/movie/now_playing"
# APIを呼び出す
response = requests.get(url, params={"api_key": api_key})

# 結果を表示
if response.status_code == 200:
# ステータスコードが200(OK)の場合
# レスポンスのJSONを取得
 data = response.json()
 #pprint(data)
# 映画の一覧を表示
 for movie in data["results"]:
  movie_id = movie["id"]
  print("id:" + str(movie_id) + '<br>')
  print('title:<a href="https://www.youtube.com/results?search_query=' + movie["title"] + '" target="_blank">' + movie["title"] + '</a><br>')
  print('<img src="https://image.tmdb.org/t/p/w500' + movie["poster_path"] + '"><br>')
  print("release_date:" + movie["release_date"] + '<br>')
  print("overview:" + movie["overview"] + "\n" + '<br><br>')

"""
 webbrowser.open("https://www.youtube.com/results?search_query=")
 y = input('映画の内容をを翻訳しますか？ : (y/n)')
 if y == "y":
  x = input('翻訳する映画のIDを入力して下さい : ')
  translations = api.get_movie_translations(x)
  pprint(translations)

else:
# ステータスコードが200以外の場合
 print("API Error")
"""
print('<img src="TMDB.png">')