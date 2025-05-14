import requests
import json
import pandas as pd

# GMOコインのAPIで最新の為替レートを取得
end_point = 'https://forex-api.coin.z.com/public'
api_path = f'/v1/ticker'

response = requests.get(f'{end_point}{api_path}')
if response.status_code != 200:
  print(f'エラーが発生しました。ステータス：{response.status_code}, メッセージ：{response.text}')
  exit(-1)

# レスポンス結果を取得
data = response.json()
#print(data)
print(" symbol:",data["data"][0]["symbol"],"\n","ask:",data["data"][0]["ask"],"\n","bid:",data["data"][0]["bid"],"\n","timestamp:",data["data"][0]["timestamp"],"\n","status:",data["data"][0]["status"])

# pandasにデータを格納
#df = pd.DataFrame(data["data"])
#print(df)

# USDJPYのデータのみ抽出
#usd_jpy_data = df.loc[df['symbol'] == 'USD_JPY']
#print(usd_jpy_data)