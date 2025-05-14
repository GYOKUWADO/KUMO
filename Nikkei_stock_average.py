import requests
from bs4 import BeautifulSoup

# 日経平均株価のページURL
url = "https://www.nikkei.com/markets/worldidx/chart/nk225/"

# ページを取得
response = requests.get(url)
soup = BeautifulSoup(response.text, 'html.parser')

# 株価を取得
price = soup.find("span", class_="economic_value_now").text
print(f"日経平均株価: {price}")