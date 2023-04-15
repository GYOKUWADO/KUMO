# KUMO
今まで作成したフロントエンドのスクリプト等をGITでの環境に移行して改良を続けていきます。

まず最初にcmd.exe.lnk(cmdのショートカット)を実行して下さい。

簡単な説明はこちら https://kumo.site/public_html/index.html

0x16.bat
このプログラムはCPUの16bitモードの時の
セグメントのアドレスを調べます。
/xオプションで
0x32を呼び出します。

0x32.bat
このプログラムは32bitアドレスを２進に変換し、
どのメモリエリアに属するかを調べます。

ac.bat
ユーザーアカウントの作成、削除を行うスクリプト。

WIPE.BAT
二度と復元しないファイルをランダムな文字列で上書きします。
通常、一度削除されたファイルは場合によって復元可能です。

active.bat
管理者アカウントを有効にし、パスワードを設定します。

enable.bat
管理者アカウントを無効にし、終了します。

google.bat
コマンドラインからgoogle検索を行います。

first.py
httpの8000番ポートでメッセージを待ち受けます。

Node_MSG
node.jsで49152番ポートでメッセージを待ち受けます。

AES.py
pip install pycryptodome
でモジュールをインストールして下さい。
python AES.pyで実行です。

AI.py
AIと話すことができます。
pip install pya3rtでモジュールをインストールして下さい。
https://a3rt.recruit.co.jp/product/talkAPI/ でAPIkeyを発行してソースに組み込んで下さい。
2021/10/28
動かなくなってます。代わりにAI_TALK.batにA3atのAPIKEYを設定して実行してください。

AI_REPLAY_ID_IN_TWIEET.py
twitterの指定したアカウントの最新の投稿にAIが返信するコードです。
api keyとtwitterのkeyを発行して組み込んで下さい。

RSA.py
python RSA.pyで実行です。余りにも小さな値は上手く動かないです。

html.bat
html作成の雛形を出力します。

Yauction.bat
ヤフーオークションの価格からの検索及びにMyauctionへのアクセス。

cmd_Twitter/Twitter.bat
twitterにかんするスクリプト。

AI_TALK.bat
AI.pyの代替え
/tオプションでOPEN_AI_TALK_TWITTER.pyを呼びだします。

AI_TALK_TWITTER_REPLAY.py
AI_REPLAY_ID_IN_TWIEET.pyの代替え。A3atのapikeyとtwitterのkeyを発行して組み込んで下さい。

FAVO_TWEET.py
python FAVO_TWEET.pyでHELPの呼び出し。

Md5Sign.js
usege is node Md5Sign.js [FileName] [Seed]
Line 33 and 34 and 35 and 36 rewriting Your Infomation
[FileName]だけをオプションで指定した時は'MD5SimpleBlockchainHash'詰まりハッシュ値が出力されます。
[FileName] [Seed]の二つのオプションを指定した時は'MD5SimpleBlockchainSignature'の値、詰まり簡易署名が
出力されますが証明できるのはSeed値を知る者のみです。

OPEN_AI_TALK_TWITTER.py
Line 8 to 11 and 28 rewriting Your Infomation
autorun.bat Line 7 in the your key rewriting
autorun.batのOPENAI_API_KEY変数をセットして
AI_TALK.batを/tオプションで呼び出しChatGPTからの応答を得てください。

BlockChain.bat
usage is BlockChain.bat [FolderName]
this program is use Block Chain Technology.
use Md5Sign.js Wrapper
example cmdline BlockChain.bat ..\WWW\music