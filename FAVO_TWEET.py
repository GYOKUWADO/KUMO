#tweetを投稿
#pip install tweepy==3.1.0
 
import tweepy
import sys
import urllib.request
import urllib.error
import re
import time
 
# 取得した各種キーを格納-----------------------------------------------------
consumer_key ="### your consumer_key in the this ###"
consumer_secret ="### your consumer_secret in the this ###"
access_token="### your access_token in the this ###"
access_token_secret ="### your access_token_secret in the this ###"
 
# Twitterオブジェクトの生成
auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)
api = tweepy.API(auth)

#-------------------------------------------------------------------------
# ツイートを投稿

my_id = "on_the_kumo"

if (len(sys.argv) <= 1):
 print('FAVO_TWEET.py [/i] [count]		IDを入力し、最新の[count]件にいいねを付ける。\nFAVO_TWEET.py [/f] [sherch keyword]	[sherch keyword]で30人フォローする。'
      '\nFAVO_TWEET.py [/h] [count]		タイムラインの[count]数、いいねを付ける。[count]は1から最大200まで')

else:
 y = str(sys.argv[1])

 if (y == "/i"):
  x = input('最新の' + sys.argv [2] + '件いいねするIDを入力して下さい : ')
  Account = x

  # user_timelineで指定したユーザーのタイムラインのTweetを取得(最大20個まで)
  tweets = api.user_timeline(Account, count=sys.argv [2], page=1)

  data = []

  for tweet in tweets:
   data.append(tweet.text)

  line = ''.join(data)
  print(line)

  for tweet in tweets:
   try:
     api.create_favorite(tweet.id)
   except:
     pass

 elif (y == "/f"):
  keyword = sys.argv [2]
  followcount = 30
  search_results = api.search(q=keyword , count=followcount)

  for result in search_results:
        screen_id = result.user._json["screen_name"]
        if screen_id != my_id:
         print(screen_id)
         api.create_friendship(screen_id)

 elif (y == "/h"):

  tweets = api.home_timeline(count=sys.argv [2])

  data = []

  for tweet in tweets:
   data.append(tweet.text)

  line = ''.join(data)
  print(line)

  for tweet in tweets:
   try:
     api.create_favorite(tweet.id)
   except:
     pass