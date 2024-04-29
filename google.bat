@echo off

TITLE GoogleSearh in cmd
IF "%1"=="" GOTO :HELP
IF "%1"=="/i" GOTO START1
IF "%1"=="/f" GOTO START2
IF "%1"=="/s" GOTO START3
IF "%1"=="/o" GOTO START4
IF "%1"=="/w" GOTO START5
IF "%1"=="/b" GOTO START6
IF NOT "%1"=="" GOTO START0
EXIT /B

:HELP
echo 検索ワードを入力してください。
echo 例 google 雲
echo 画像検索をするには /i オプションをつけてください。
echo 例 google /i 雲
echo フィルタを表示するには /f オプションをつけてください。
echo 例 google /f
echo サイトマップを送信するには /s オプションをつけてください。
echo 例 google /s
echo ON THE KUMO PROJECTにブラウザでアクセスするには /o オプションをつけてください。
echo 例 google /o
echo [www.webmodelers.com]内の検索
echo 例 google /w 零戦
echo ブランドの最新情報 [一週間以内/24時間以内] /b オプション [BrandList.txtにターゲットにするブランドのURLを記述して下さい。]
echo 例 google /b [アクセサリー]
echo 例 google /b
GOTO :EOF

:START0
rem 複数検索ワードに対応
rem 半角スペースと全角スペースを+へ置換する
rem 検索ワード1 検索ワード2 ⇒ 検索ワード1+検索ワード2
set line=%*
set line=%line: =+%
set search_keys=%line: =+%

rem Google検索！
start https://www.google.co.jp/search?q=%search_keys%
GOTO :EOF

:START1
set line=%*
set line=%line:~3%
set search_keys=%line: =+%

rem Google画像検索
start https://www.google.co.jp/search?q=%search_keys%^&tbm=isch
GOTO :EOF

:START2
start http://kumo.site/document/txt/GoogleSerchCode.txt
GOTO :EOF

:START3
IF "%sitemap%"=="" echo 管理者権限でcmdを実行して、SETX /M sitemap [url] で変数 sitemap を定義してください。
IF "%sitemap%"=="" exit /B
start https://www.google.com/ping?sitemap=%sitemap%
GOTO :EOF

:START4
start http://kumo.site
GOTO :EOF

:START5
set line=%*
set line=%line:~3%
set search_keys=%line: =+%

:START6
set line=%*
set line=%line:~3%
set search_keys=%line: =+%

IF %search_keys%== =+ CALL :NULL

set /p WorD="一週間以内(W)か24時間以内(D)を指定してください(W/D)"
IF %WorD%==W set tbs=^&tbs=qdr:w
IF %WorD%==D set tbs=^&tbs=qdr:d

IF defined search_keys FOR /F "skip=1" %%i in (BrandList.txt) do start https://www.google.co.jp/search?q=%search_keys%+site:%%i^%tbs%^&tbm=isch
IF not defined search_keys FOR /F "skip=1" %%i in (BrandList.txt) do start https://www.google.co.jp/search?q=site:%%i^%tbs%^&tbm=isch
GOTO :NULL

rem Google検索！
start https://www.google.co.jp/search?q=%search_keys%+site:www.webmodelers.com
GOTO :EOF

:NULL
set line=
set search_keys=
GOTO :EOF

rem 参考URL
rem ウィンドウ最小化状態でバッチを実行する
rem https://blog.cles.jp/item/8980