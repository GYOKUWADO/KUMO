import tweepy
import pandas as pd
import webbrowser

CONSUMER_KEY = ''
CONSUMER_SECRET = ''
ACCESS_TOKEN = ''
ACCESS_SECRET = ''

auth = tweepy.OAuthHandler(CONSUMER_KEY, CONSUMER_SECRET)
auth.set_access_token(ACCESS_TOKEN, ACCESS_SECRET)
api = tweepy.API(auth)

woeid = {
    "日本": 23424856
}

"""
woeid = {
    "United States": 23424977
}
"""

url = "https://www.google.co.jp/search?q="

for area, wid in woeid.items():
    print("--- {} ---".format(area))
    trends = api.trends_place(wid)[0]
    for i, content in enumerate(trends["trends"]):
     if i < 10: #最大50
        print(i+1, content['name'])
        if i == 0 :
           global TopTrends
           TopTrends = content['name']
        if i == 1 :
           global Trends2
           Trends2 = content['name']
        if i == 2 :
           global Trends3
           Trends3 = content['name']
        if i == 3 :
           global Trends4
           Trends4 = content['name']
        if i == 4 :
           global Trends5
           Trends5 = content['name']
        if i == 5 :
           global Trends6
           Trends6 = content['name']
        if i == 6 :
           global Trends7
           Trends7 = content['name']
        if i == 7 :
           global Trends8
           Trends8 = content['name']
        if i == 8 :
           global Trends9
           Trends9 = content['name']
        if i == 9 :
           global Trends10
           Trends10 = content['name']

        if i == 10 :
           global Trends11
           Trends11 = content['name']
        if i == 11 :
           global Trends12
           Trends12 = content['name']
        if i == 12 :
           global Trends13
           Trends13 = content['name']
        if i == 13 :
           global Trends14
           Trends14 = content['name']
        if i == 14 :
           global Trends15
           Trends15 = content['name']
        if i == 15 :
           global Trends16
           Trends16 = content['name']
        if i == 16 :
           global Trends17
           Trends17 = content['name']
        if i == 17 :
           global Trends18
           Trends18 = content['name']
        if i == 18 :
           global Trends19
           Trends19 = content['name']
        if i == 19 :
           global Trends20
           Trends20 = content['name']

        if i == 20 :
           global Trends21
           Trends21 = content['name']
        if i == 21 :
           global Trends22
           Trends22 = content['name']
        if i == 22 :
           global Trends23
           Trends23 = content['name']
        if i == 23 :
           global Trends24
           Trends24 = content['name']
        if i == 24 :
           global Trends25
           Trends25 = content['name']
        if i == 25 :
           global Trends26
           Trends26 = content['name']
        if i == 26 :
           global Trends27
           Trends27 = content['name']
        if i == 27 :
           global Trends28
           Trends28 = content['name']
        if i == 28 :
           global Trends29
           Trends29 = content['name']
        if i == 29 :
           global Trends30
           Trends30 = content['name']

        if i == 30 :
           global Trends31
           Trends31 = content['name']
        if i == 31 :
           global Trends32
           Trends32 = content['name']
        if i == 32 :
           global Trends33
           Trends33 = content['name']
        if i == 33 :
           global Trends34
           Trends34 = content['name']
        if i == 34 :
           global Trends35
           Trends35 = content['name']
        if i == 35 :
           global Trends36
           Trends36 = content['name']
        if i == 36 :
           global Trends37
           Trends37 = content['name']
        if i == 37 :
           global Trends38
           Trends38 = content['name']
        if i == 38 :
           global Trends39
           Trends39 = content['name']
        if i == 39 :
           global Trends40
           Trends40 = content['name']

        if i == 40 :
           global Trends41
           Trends41 = content['name']
        if i == 41 :
           global Trends42
           Trends42 = content['name']
        if i == 42 :
           global Trends43
           Trends43 = content['name']
        if i == 43 :
           global Trends44
           Trends44 = content['name']
        if i == 44 :
           global Trends45
           Trends45 = content['name']
        if i == 45 :
           global Trends46
           Trends46 = content['name']
        if i == 46 :
           global Trends47
           Trends47 = content['name']
        if i == 47 :
           global Trends48
           Trends48 = content['name']
        if i == 48 :
           global Trends49
           Trends49 = content['name']
        if i == 49 :
           global Trends50
           Trends50 = content['name']

#print(TopTrends)
#ベスト10のトレンドワードでHACK
#api.update_status("HACK" + " " + TopTrends + " " + Trends2 + " " + Trends3 + " " + Trends4 + " " + Trends5 + " " + Trends6 + " " + Trends7 + " " + Trends8 + " " + Trends9 + " " + Trends10)

def Trends_Twieet():
 while True:
  YorN = input('トレンドワードでツイートしますか？(y/n)')
  if YorN == "y" :
   No = input('トレンドワードの番号を入力して下さい。')
   SerchTrend = input('トレンドをブラウザで検索しますか？(y/n)')
   if SerchTrend == "y" :
        if No == "1" :
           if TopTrends[0:1] == "#":
              webbrowser.open(url + "%23" + TopTrends[1:], 2)
           else:
              webbrowser.open(url + TopTrends, 2)
        if No == "2" :
           if Trends2[0:1] == "#":
              webbrowser.open(url + "%23" + Trends2[1:], 2)
           else:
              webbrowser.open(url + Trends2, 2)
        if No == "3" :
           if Trends3[0:1] == "#":
              webbrowser.open(url + "%23" + Trends3[1:], 2)
           else:
              webbrowser.open(url + Trends3, 2)
        if No == "4" :
           if Trends4[0:1] == "#":
              webbrowser.open(url + "%23" + Trends4[1:], 2)
           else:
              webbrowser.open(url + Trends4, 2)
        if No == "5" :
           if Trends5[0:1] == "#":
              webbrowser.open(url + "%23" + Trends5[1:], 2)
           else:
              webbrowser.open(url + Trends5, 2)
        if No == "6" :
           if Trends6[0:1] == "#":
              webbrowser.open(url + "%23" + Trends6[1:], 2)
           else:
              webbrowser.open(url + Trends6, 2)
        if No == "7" :
           if Trends7[0:1] == "#":
              webbrowser.open(url + "%23" + Trends7[1:], 2)
           else:
              webbrowser.open(url + Trends7, 2)
        if No == "8" :
           if Trends8[0:1] == "#":
              webbrowser.open(url + "%23" + Trends8[1:], 2)
           else:
              webbrowser.open(url + Trends8, 2)
        if No == "9" :
           if Trends9[0:1] == "#":
              webbrowser.open(url + "%23" + Trends9[1:], 2)
           else:
              webbrowser.open(url + Trends9, 2)
        if No == "10" :
           if Trends10[0:1] == "#":
              webbrowser.open(url + "%23" + Trends10[1:], 2)
           else:
              webbrowser.open(url + Trends10, 2)

        if No == "11" :
           if Trends11[0:1] == "#":
              webbrowser.open(url + "%23" + Trends11[1:], 2)
           else:
              webbrowser.open(url + Trends11, 2)
        if No == "12" :
           if Trends12[0:1] == "#":
              webbrowser.open(url + "%23" + Trends12[1:], 2)
           else:
              webbrowser.open(url + Trends12, 2)
        if No == "13" :
           if Trends13[0:1] == "#":
              webbrowser.open(url + "%23" + Trends13[1:], 2)
           else:
              webbrowser.open(url + Trends13, 2)
        if No == "14" :
           if Trends14[0:1] == "#":
              webbrowser.open(url + "%23" + Trends14[1:], 2)
           else:
              webbrowser.open(url + Trends14, 2)
        if No == "15" :
           if Trends15[0:1] == "#":
              webbrowser.open(url + "%23" + Trends15[1:], 2)
           else:
              webbrowser.open(url + Trends15, 2)
        if No == "16" :
           if Trends16[0:1] == "#":
              webbrowser.open(url + "%23" + Trends16[1:], 2)
           else:
              webbrowser.open(url + Trends16, 2)
        if No == "17" :
           if Trends17[0:1] == "#":
              webbrowser.open(url + "%23" + Trends17[1:], 2)
           else:
              webbrowser.open(url + Trends17, 2)
        if No == "18" :
           if Trends18[0:1] == "#":
              webbrowser.open(url + "%23" + Trends18[1:], 2)
           else:
              webbrowser.open(url + Trends18, 2)
        if No == "19" :
           if Trends19[0:1] == "#":
              webbrowser.open(url + "%23" + Trends19[1:], 2)
           else:
              webbrowser.open(url + Trends19, 2)
        if No == "20" :
           if Trends20[0:1] == "#":
              webbrowser.open(url + "%23" + Trends20[1:], 2)
           else:
              webbrowser.open(url + Trends20, 2)

        if No == "21" :
           if Trends21[0:1] == "#":
              webbrowser.open(url + "%23" + Trends21[1:], 2)
           else:
              webbrowser.open(url + Trends21, 2)
        if No == "22" :
           if Trends22[0:1] == "#":
              webbrowser.open(url + "%23" + Trends22[1:], 2)
           else:
              webbrowser.open(url + Trends22, 2)
        if No == "23" :
           if Trends23[0:1] == "#":
              webbrowser.open(url + "%23" + Trends23[1:], 2)
           else:
              webbrowser.open(url + Trends23, 2)
        if No == "24" :
           if Trends24[0:1] == "#":
              webbrowser.open(url + "%23" + Trends24[1:], 2)
           else:
              webbrowser.open(url + Trends24, 2)
        if No == "25" :
           if Trends25[0:1] == "#":
              webbrowser.open(url + "%23" + Trends25[1:], 2)
           else:
              webbrowser.open(url + Trends25, 2)
        if No == "26" :
           if Trends26[0:1] == "#":
              webbrowser.open(url + "%23" + Trends26[1:], 2)
           else:
              webbrowser.open(url + Trends26, 2)
        if No == "27" :
           if Trends27[0:1] == "#":
              webbrowser.open(url + "%23" + Trends27[1:], 2)
           else:
              webbrowser.open(url + Trends27, 2)
        if No == "28" :
           if Trends28[0:1] == "#":
              webbrowser.open(url + "%23" + Trends28[1:], 2)
           else:
              webbrowser.open(url + Trends28, 2)
        if No == "29" :
           if Trends29[0:1] == "#":
              webbrowser.open(url + "%23" + Trends29[1:], 2)
           else:
              webbrowser.open(url + Trends29, 2)
        if No == "30" :
           if Trends30[0:1] == "#":
              webbrowser.open(url + "%23" + Trends30[1:], 2)
           else:
              webbrowser.open(url + Trends30, 2)

        if No == "31" :
           if Trends31[0:1] == "#":
              webbrowser.open(url + "%23" + Trends31[1:], 2)
           else:
              webbrowser.open(url + Trends31, 2)
        if No == "32" :
           if Trends32[0:1] == "#":
              webbrowser.open(url + "%23" + Trends32[1:], 2)
           else:
              webbrowser.open(url + Trends32, 2)
        if No == "33" :
           if Trends33[0:1] == "#":
              webbrowser.open(url + "%23" + Trends33[1:], 2)
           else:
              webbrowser.open(url + Trends33, 2)
        if No == "34" :
           if Trends34[0:1] == "#":
              webbrowser.open(url + "%23" + Trends34[1:], 2)
           else:
              webbrowser.open(url + Trends34, 2)
        if No == "35" :
           if Trends35[0:1] == "#":
              webbrowser.open(url + "%23" + Trends35[1:], 2)
           else:
              webbrowser.open(url + Trends35, 2)
        if No == "36" :
           if Trends36[0:1] == "#":
              webbrowser.open(url + "%23" + Trends36[1:], 2)
           else:
              webbrowser.open(url + Trends36, 2)
        if No == "37" :
           if Trends37[0:1] == "#":
              webbrowser.open(url + "%23" + Trends37[1:], 2)
           else:
              webbrowser.open(url + Trends37, 2)
        if No == "38" :
           if Trends38[0:1] == "#":
              webbrowser.open(url + "%23" + Trends38[1:], 2)
           else:
              webbrowser.open(url + Trends38, 2)
        if No == "39" :
           if Trends39[0:1] == "#":
              webbrowser.open(url + "%23" + Trends39[1:], 2)
           else:
              webbrowser.open(url + Trends39, 2)
        if No == "40" :
           if Trends40[0:1] == "#":
              webbrowser.open(url + "%23" + Trends40[1:], 2)
           else:
              webbrowser.open(url + Trends40, 2)

        if No == "41" :
           if Trends41[0:1] == "#":
              webbrowser.open(url + "%23" + Trends41[1:], 2)
           else:
              webbrowser.open(url + Trends41, 2)
        if No == "42" :
           if Trends42[0:1] == "#":
              webbrowser.open(url + "%23" + Trends42[1:], 2)
           else:
              webbrowser.open(url + Trends42, 2)
        if No == "43" :
           if Trends43[0:1] == "#":
              webbrowser.open(url + "%23" + Trends43[1:], 2)
           else:
              webbrowser.open(url + Trends43, 2)
        if No == "44" :
           if Trends44[0:1] == "#":
              webbrowser.open(url + "%23" + Trends44[1:], 2)
           else:
              webbrowser.open(url + Trends44, 2)
        if No == "45" :
           if Trends45[0:1] == "#":
              webbrowser.open(url + "%23" + Trends45[1:], 2)
           else:
              webbrowser.open(url + Trends45, 2)
        if No == "46" :
           if Trends46[0:1] == "#":
              webbrowser.open(url + "%23" + Trends46[1:], 2)
           else:
              webbrowser.open(url + Trends46, 2)
        if No == "47" :
           if Trends47[0:1] == "#":
              webbrowser.open(url + "%23" + Trends47[1:], 2)
           else:
              webbrowser.open(url + Trends47, 2)
        if No == "48" :
           if Trends48[0:1] == "#":
              webbrowser.open(url + "%23" + Trends48[1:], 2)
           else:
              webbrowser.open(url + Trends48, 2)
        if No == "49" :
           if Trends49[0:1] == "#":
              webbrowser.open(url + "%23" + Trends49[1:], 2)
           else:
              webbrowser.open(url + Trends49, 2)
        if No == "50" :
           if Trends50[0:1] == "#":
              webbrowser.open(url + "%23" + Trends50[1:], 2)
           else:
              webbrowser.open(url + Trends50, 2)

   Tw = input('ツイートを入力して下さい。')
   if No == "1" :
      api.update_status(Tw + " " + TopTrends)
   if No == "2" :
      api.update_status(Tw + " " + Trends2)
   if No == "3" :
      api.update_status(Tw + " " + Trends3)
   if No == "4" :
      api.update_status(Tw + " " + Trends4)
   if No == "5" :
      api.update_status(Tw + " " + Trends5)
   if No == "6" :
      api.update_status(Tw + " " + Trends6)
   if No == "7" :
      api.update_status(Tw + " " + Trends7)
   if No == "8" :
      api.update_status(Tw + " " + Trends8)
   if No == "9" :
      api.update_status(Tw + " " + Trends9)
   if No == "10" :
      api.update_status(Tw + " " + Trends10)

   if No == "11" :
      api.update_status(Tw + " " + Trends11)
   if No == "12" :
      api.update_status(Tw + " " + Trends12)
   if No == "13" :
      api.update_status(Tw + " " + Trends13)
   if No == "14" :
      api.update_status(Tw + " " + Trends14)
   if No == "15" :
      api.update_status(Tw + " " + Trends15)
   if No == "16" :
      api.update_status(Tw + " " + Trends16)
   if No == "17" :
      api.update_status(Tw + " " + Trends17)
   if No == "18" :
      api.update_status(Tw + " " + Trends18)
   if No == "19" :
      api.update_status(Tw + " " + Trends19)
   if No == "20" :
      api.update_status(Tw + " " + Trends20)

   if No == "21" :
      api.update_status(Tw + " " + Trends21)
   if No == "22" :
      api.update_status(Tw + " " + Trends22)
   if No == "23" :
      api.update_status(Tw + " " + Trends23)
   if No == "24" :
      api.update_status(Tw + " " + Trends24)
   if No == "25" :
      api.update_status(Tw + " " + Trends25)
   if No == "26" :
      api.update_status(Tw + " " + Trends26)
   if No == "27" :
      api.update_status(Tw + " " + Trends27)
   if No == "28" :
      api.update_status(Tw + " " + Trends28)
   if No == "29" :
      api.update_status(Tw + " " + Trends29)
   if No == "30" :
      api.update_status(Tw + " " + Trends30)

   if No == "31" :
      api.update_status(Tw + " " + Trends31)
   if No == "32" :
      api.update_status(Tw + " " + Trends32)
   if No == "33" :
      api.update_status(Tw + " " + Trends33)
   if No == "34" :
      api.update_status(Tw + " " + Trends34)
   if No == "35" :
      api.update_status(Tw + " " + Trends35)
   if No == "36" :
      api.update_status(Tw + " " + Trends36)
   if No == "37" :
      api.update_status(Tw + " " + Trends37)
   if No == "38" :
      api.update_status(Tw + " " + Trends38)
   if No == "39" :
      api.update_status(Tw + " " + Trends39)
   if No == "40" :
      api.update_status(Tw + " " + Trends40)

   if No == "41" :
      api.update_status(Tw + " " + Trends41)
   if No == "42" :
      api.update_status(Tw + " " + Trends42)
   if No == "43" :
      api.update_status(Tw + " " + Trends43)
   if No == "44" :
      api.update_status(Tw + " " + Trends44)
   if No == "45" :
      api.update_status(Tw + " " + Trends45)
   if No == "46" :
      api.update_status(Tw + " " + Trends46)
   if No == "47" :
      api.update_status(Tw + " " + Trends47)
   if No == "48" :
      api.update_status(Tw + " " + Trends48)
   if No == "49" :
      api.update_status(Tw + " " + Trends49)
   if No == "50" :
      api.update_status(Tw + " " + Trends50)
  if YorN == "n" :
   break

Trends_Twieet()