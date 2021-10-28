#tweetを投稿

import subprocess 
import tweepy
import sys
#import jtalk
 
# 取得した各種キーを格納-----------------------------------------------------
consumer_key ="###"
consumer_secret ="###"
access_token="###"
access_token_secret ="###"
 
# Twitterオブジェクトの生成
auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)
api = tweepy.API(auth)
#-------------------------------------------------------------------------
# ツイートを投稿

x = input('AIが返信するIDを入力して下さい : ')
Account = x

#reply= sys.argv [1]

# user_timelineで指定したユーザーのタイムラインのTweetを取得(最大20個まで)
tweets = api.user_timeline(Account, count=1, page=1)

data = []

for tweet in tweets:
 data.append(tweet.text)

line = ''.join(data)
print(line)

command = 'curl -s -X POST https://api.a3rt.recruit.co.jp/talk/v1/smalltalk -F "apikey=###your api key in this site https://a3rt.recruit.co.jp/product/talkAPI/ ###" -F "query=line" | jq -c .results[].reply'                  #！ここに実行したいコマンドを書く！
proc = subprocess.Popen(
    command,
    shell  = True,                            #シェル経由($ sh -c "command")で実行。
    stdin  = subprocess.PIPE,                 #1
    stdout = subprocess.PIPE,                 #2
    stderr = subprocess.PIPE)                 #3

stdout_data, stderr_data = proc.communicate() #処理実行を待つ(†1)
#print (stdout_data.decode())  #標準出力の確認
#print (stderr_data)  #標準エラーの確認

tmp = (stdout_data.decode()) 

reply=tmp.replace('"','')

print(reply)

#api.update_status(x)

for tweet in tweets:
 if reply != ' ':
  reply_text = "@"+str(tweet.user.screen_name) +" "+ reply + " #AI #My_name_is_白蓮 #いいね https://github.com/KenziHashimoto/KUMO/blob/master/AI_REPLAY_ID_IN_TWIEET.py"
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
  