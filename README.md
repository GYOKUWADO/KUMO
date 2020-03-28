# KUMO
今まで作成したフロントエンドのスクリプト等をGITでの環境に移行して改良を続けていきます。

0x16.bat

このプログラムはCPUの16bitモードの時の
セグメントのアドレスを調べます。
/xオプションでcallし
0x32を呼び出します。



0x32.bat

このプログラムは32bitアドレスを２進に変換し、

どのメモリエリアに属するかを調べます。



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

Virus_Detect.bat
Virus_Detect_sha256.batをコマンドラインから実行するとTrend_micro_Virus_Detect_sha256.txtに記述された、
TrendoMicroのウィルスのsha256ハッシュとダウンロードしたjavascriptファイルを比較して一致すれば知らせます。
./get_jsフォルダの一階層下の[ドメイン]フォルダに1から順番にjsをダウンロードしてsha256hashを計算します。
なお、htmlファイルはV_detect.txtとゆうファイル名で保存されます。
適宜、TrendoMicroから発行されるjavascriptウィルスのsha256hashをTrend_micro_Virus_Detect_sha256.txtに追記していってください。

Jpnews.bat
カレントディレクトリJpnews で Jpnews.bat を引数 /g で実行すると
更新された関西の htmlファイルを kansai_news.html にリダイレクトします。

AES.py
pip install pycryptodome
でモジュールをインストールして下さい。
python AES.pyで実行です。

RSA.py
python RSA.pyで実行です。余りにも小さな値は上手く動かないです。
