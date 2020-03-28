#!C:\Users\kenzi\AppData\Local\Programs\Python\Python37\python.exe

import re
import os
import requests
import urllib.request

path = 'NewsPaper.txt'

data = open(path,"r")

def news():

  #i = 0

  for line in data:
       #i += 1
       m = re.match("https?://(?P<www_url>[\w:%#\$&\?\(\)~\.=\+\-]+)", line)
       DIR_NAME_0 = './news/' + m.group('www_url') + '/'

       if not os.path.exists(DIR_NAME_0):
           os.mkdir(DIR_NAME_0)

       print("URL is " + "\"" + m.group('www_url') + "\"")
       
       terget_url = line + "sitemap.xml"

       response = requests.get(terget_url.replace('\n',''))
       status = response.status_code
       print("status code is " + "\"" + str(status) + "\"")
 
       if status == 200:

          #filename = 'sitemap' + os.path.splitext(terget_url)[1]

          print("filename is " + "\"" + "sitemap.xml" + "\"")
          print("#################################################")

          req = urllib.request.Request(terget_url.replace('\n',''))
          req.add_header('User-Agent', 'ON THE KUMO PYTHON UA')

          with urllib.request.urlopen(req) as res:
               xml = res.read()
               with open(DIR_NAME_0 + "{0}".format("sitemap.xml"), mode='wb') as local_file:
                    local_file.write(xml)

       else:
          print("#################################################")

if __name__ == '__main__':
    news()