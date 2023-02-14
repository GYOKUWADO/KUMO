#tweetを投稿
 
import tweepy
import sys
#import jtalk
 
# 取得した各種キーを格納-----------------------------------------------------
consumer_key ="### your twitter consumer key ###"
consumer_secret ="### your twitter consumer secret key ###"
access_token="### your twitter access token ###"
access_token_secret ="### your twitter access token secret ###"
 
# Twitterオブジェクトの生成
auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)
api = tweepy.API(auth)
#-------------------------------------------------------------------------
# ツイートを投稿

MESSAGE_REPLY_DEFAULT = ' '

x = sys.argv [1]

reply= sys.argv [2]

api.update_status(x + "#AI_to_reply_MSG")

Account = '#####YOUR TWITTER ACCOUNT#####'

# user_timelineで指定したユーザーのタイムラインのTweetを取得(最大20個まで)
tweets = api.user_timeline(Account, count=1, page=1)

#msg = 'reply from python'
for tweet in tweets:
 if reply != ' ':
  reply_text = "@"+str(tweet.user.screen_name) +" "+ reply + " #AI"
  # テキスト(メッセージ)のみ
  api.update_status(status = reply_text, in_reply_to_status_id = tweet.id)
 else:
  reply_text = "@"+str(tweet.user.screen_name) +" "+ "..." + " #AI"
  # テキスト(メッセージ)のみ
  api.update_status(status = reply_text, in_reply_to_status_id = tweet.id)