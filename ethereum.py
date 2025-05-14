import datetime
import requests
import locale

# ロケールを日本に設定
locale.setlocale(locale.LC_ALL, 'ja_JP.UTF-8')

def get_ethereum_price():
    url = "https://api.coingecko.com/api/v3/simple/price"
    params = {
        'ids': 'ethereum',
        'vs_currencies': 'jpy'
    }
    response = requests.get(url, params=params)
    data = response.json()
    return data['ethereum']['jpy']

now = datetime.datetime.now()
T = now.strftime('%Y-%m-%d %H:%M:%S')

price = get_ethereum_price()
formatted_number = locale.format_string("%d", price, grouping=True)
print(f"CoinGecko 現在のイーサリアムの価格 = {formatted_number} 円")
print(f"取得時間 = {T}")