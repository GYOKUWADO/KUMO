#tweetを投稿
 
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

my_id = "### your id in the this. not add head's @ mark (彼方のTwitterIDを記述して下さい。先頭の@マークは要りません。)###"

if (len(sys.argv) <= 1):
 print("FAVO_TWEET.py [/i] [count]\nIDを入力し、最新の[count]件にいいねを付ける。\nFAVO_TWEET.py [/f] [sherch keyword]\n[sherch keyword]で30人フォローする。")

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