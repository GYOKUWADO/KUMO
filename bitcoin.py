from datetime import datetime, timedelta
import requests

url = 'https://api.bitflyer.com/v1/ticker'
bf = requests.get(url).json()

bf_ltp = '{:,}'.format(int(bf['ltp']))

bf_timestamp = datetime.strptime(bf['timestamp'], '%Y-%m-%dT%H:%M:%S.%f') + timedelta(hours=9)
bf_timestamp = '{0:%Y-%m-%d %H:%M:%S}'.format(bf_timestamp)

print(f"bitFlyer 現在のビットコインの価格 = {bf_ltp} 円")
print(f"取得時間 = {bf_timestamp}")