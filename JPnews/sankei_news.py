#!C:\Users\kenzi\AppData\Local\Programs\Python\Python37\python.exe

import datetime
import time, datetime
import cchardet
import requests
import re
import sys
import io
from bs4 import BeautifulSoup

time_path = 'xml_time.txt'
today = datetime.datetime.fromtimestamp(time.time())
settime = today.strftime('%Y-%m-%dT%H:%M:%S')

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf_8')

date_time0 = datetime.date.today()

StartTag =    """<!doctype html>\n<html>\n<head>"""
code =        """<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />"""
css =         """<meta http-equiv="Content-style-Type" content="text/css" />"""
java =        """<meta http-equiv="Content-Script-Type" content="text/javascript" />"""
title_in =    """<title>ON THE KUMO NEWS FROM KANSAI</title>"""
author =      """<meta name="author" content="" />"""
description = """<meta name="description" content="" />"""
keywords =    """<meta name="keywords" content="" />"""
generator =   """<meta name="generator" content="notepad.exe,Terapad" />"""
robots =      """<meta name="robots" content="index" />"""
style =       """<link type="text/css" media="all" rel="stylesheet" href="news.css" />"""
jquery =      """<script src="http://code.jquery.com/jquery-3.2.0.min.js"></script>"""
imgG =        """<script type="text/javascript" src="imgGuard.js"></script>"""
Endhead =     """</head>"""
body =        """<body>"""
img =         """<a href="#"><img id="topnews" class="imgGuard" title="" rel="noindex" src="kansai.png" alt="NewsImage" /></a>"""
Endbody =     """</body>\n</html>"""

with open(time_path) as f:
    s = f.read()

def news():

   i = 0

   DIR_NAME_0 = './news/www.sankei.com/'

   with open(DIR_NAME_0 + "sitemap.xml") as f:
        loc_tag = f.read()
        soup = BeautifulSoup(loc_tag, 'lxml')
        for a in soup.find_all("url"):

           url_list = a.loc.string
           #print(url_list)
           search_result = re.search(".*west/news.*.*.html",url_list)
           if search_result is not None:

             lastmod = a.lastmod.string
             #print(url_list)
             #print(search_result)

             if lastmod > s:

               #print(lastmod + ' > ' + s + search_result.group())

               response = requests.get(search_result.group())
               response.encoding = cchardet.detect(response.content)["encoding"]

               status = response.status_code

               if status == 200:

                 i += 1

                 soup = BeautifulSoup(response.text, 'lxml')
                 title = soup.title.string
                 description = soup.select('meta[name=description]')
                 description_in = description[0]
                 #print(str(i) + title + ',' + description_in.attrs['content'] + ',' + lastmod + ',' + search_result.group())

                 print ('<h3><p style="font-size:160%;" id="news_kumo_',str(i),'" class="on_kumo_news_title"><span class="No">',str(i),'</span>:',title,'</p></h3><br>',sep='')
                 print ('<p id="news_kumo_description',str(i),'" class="on_kumo_news_description">',(description_in.attrs['content']),'</p><br>',sep='')
                 print ('<p class="on_kumo_news"><span style="color:#ff0000;font-family:serif;">lastmod is </span><span style="font-family:serif;">',lastmod,'</span></p><br>',sep='')
                 print ('<a title="No',str(i),'" id="',str(i),'" class="on_kumo_news" href="',search_result.group(),'">',search_result.group(),'</a><br>',sep='')

def main():
    print (StartTag)
    print (code)
    print (css)
    print (java)
    print (title_in)
    print (author)
    print (description)
    print (keywords)
    print ('<meta name="date" content="',date_time0,'"/>',sep='')
    print (generator)
    print (robots)
    print (style)
    print (jquery)
    print (imgG)
    print (Endhead)
    print (body)
    print (img)
    print ('<p id="news_date" style="text-align: center;" title="day and time" />',s.rstrip('\n'),'以降に更新された関西の産経ニュース</p><br>',sep='')

    news()

    print('<p style="text-align: center;">(c)2019 SANKEI DIGITAL INC.</p>')
    print (Endbody)

if __name__ == '__main__':
    main()