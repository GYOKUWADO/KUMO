@echo off

TITLE YahooAuctionSearh in cmd
IF "%1"=="" GOTO :HELP
IF "%1"=="/p" GOTO START1
IF "%1"=="/m" GOTO START2
IF NOT "%1"=="" GOTO START0
GOTO :EOF

:HELP
echo Yauction [[検索ワード]+[検索ワード]]
echo Yauction [/p] [価格] [[検索ワード]+[検索ワード]]
echo Yauction [/p] [価格] [/t] [[検索ワード]+[検索ワード]]
echo Yauction [/p] [価格] [/f] [[検索ワード]+[検索ワード]]
echo Yauction [/p] [価格] [/0] [[検索ワード]+[検索ワード]]
echo Yauction [/m]

echo /p 入力した価格以下
echo /t 真作
echo /f 模写
echo /0 真作/模写の判断無し
echo /m Myauction
GOTO :EOF

:START0
set line=%*
set line=%line: =+%
set search_keys=%line: =+%

start https://auctions.yahoo.co.jp/search/search?va=%search_keys%^&n=20
GOTO :EOF

:START1
set maxprice=%2

REM set line=%*
REM set line=%line:~3%
REM set search_keys=%line: =+%
set TorF=
IF "%3"=="/t" set TorF=真作
IF "%3"=="/f" set TorF=模写
IF "%3"=="/0" set TorF=
set search_keys=%4

start https://auctions.yahoo.co.jp/search/search?va=%search_keys%+%TorF%^&aucmaxprice=%maxprice%^&n=20
GOTO :EOF

:START2
start https://auctions.yahoo.co.jp/openuser/jp/show/mystatus?select=selling
GOTO :EOF