#tweetを投稿
 
import tweepy
import pya3rt
#import jtalk
 
# 取得した各種キーを格納-----------------------------------------------------
consumer_key ="### your twitter key ###"
consumer_secret ="### your twitter key ###"
access_token="### your twitter token ###"
access_token_secret ="### your twitter token ###"
 
# Twitterオブジェクトの生成
auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)
api = tweepy.API(auth)
#-------------------------------------------------------------------------
# ツイートを投稿

MESSAGE_REPLY_DEFAULT = ' '

x = input('AIが返信するIDを入力して下さい : ')
Account = x

# user_timelineで指定したユーザーのタイムラインのTweetを取得(最大20個まで)
tweets = api.user_timeline(Account, count=1, page=1)

data = []

for tweet in tweets:
 data.append(tweet.text)

line = ''.join(data)
print(line)

#api.update_status(x)

def send_message(message):
    apikey = "###your api key in this site https://a3rt.recruit.co.jp/product/talkAPI/ ###"
    client = pya3rt.TalkClient(apikey)
    reply_message = client.talk(message)
    print(reply_message['message'])
    if reply_message['message'] == 'empty reply':
       return MESSAGE_REPLY_DEFAULT
    return reply_message['results'][0]['reply']

message = line
reply   = send_message(message)
print(reply)

for tweet in tweets:
 if reply != ' ':
  reply_text = "@"+str(tweet.user.screen_name) +" "+ reply + " #AI #いいね"
  # テキスト(メッセージ)のみ
  try:      
     api.update_status(status = reply_text, in_reply_to_status_id = tweet.id)
     api.create_favorite(tweet.id)
  except:
     pass
 else:
  reply_text = "@"+str(tweet.user.screen_name) +" "+ "..." + " #AI #いいね"
  # テキスト(メッセージ)のみ
  try:      
     api.update_status(status = reply_text, in_reply_to_status_id = tweet.id)
     api.create_favorite(tweet.id)
  except:
     pass