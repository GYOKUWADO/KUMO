#!/usr/bin/env python3
# -*- coding:utf-8 -*-
#以下のコマンドを実行する
#pip install youtube_dl
#pip install requests
#pip install BeautifulSoup4
#pip install html5lib


import subprocess
import requests
import webbrowser
import sys
from bs4 import BeautifulSoup

cmd = 'youtube-dl'

class Content:
    pass

class Youtube:
    URL = 'https://www.youtube.com%s'

    @classmethod
    def url(self, path='/'):
        return self.URL % path

    @classmethod
    def url_search(self, query):
        return self.url('/results?search_query=%s') % query

    @classmethod
    def url_embed(self, vid):
        return self.url('/embed/%s') % vid

    @classmethod
    def search(self, query, num=10):
        num = min(num, 20) # 最大20件まで
        req = requests.get(self.url_search(query))
        html = req.text.encode(req.encoding).decode('utf-8', 'strict')
        soup = BeautifulSoup(html, 'html5lib')
        h3s = soup.find_all('h3', {'class': 'yt-lockup-title'})
        for h3 in h3s[:num]:
            href = h3.a.get('href')
            vid = href.split('=')[-1]
            content = Content()
            content.title = h3.a.get('title')
            content.url = self.url(href)
            content.embed = self.url_embed(vid)
            #content.time = h3.span.text.replace(' - 長さ: ','').replace('。','')
            content.info = h3.text # >>タイトル - 長さ：00:00。
            yield content

class UI:
    @staticmethod
    def start():
        #while True:
            query = sys.argv
            if not query:
                return
            contents = list(Youtube.search(query[1], num=10))
            for content in UI.select(contents):
                print(content.url)
                openweb = str(input("ブラウザでアクセスしますか？(y/n):"))
                if openweb == "y":
                   webbrowser.open(content.url)
                openweb = str(input("動画をダウンロードしますか？(y/n):"))
                if openweb == "y":
                   subprocess.call((cmd, content.url))
 
    @staticmethod
    def select(contents):
        for number, content in enumerate(contents, 1):
            print('%s: %s' % (number, content.info))
        while True:
            try:
                number = int(input('番号を選んでください(0は選択終了): '))
            except ValueError:
                number = -1
            if number == 0:
                return
            if 0 < number <= len(contents):
                yield contents[number - 1]
            else:
                print('正しい番号を入力してください。')

if __name__ == '__main__':
    UI.start()