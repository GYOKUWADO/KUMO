REM 37行目のテキストにリストを作成してください。

@echo off

TITLE TwitterSearh in cmd
IF "%1"=="" GOTO :HELP
IF "%1"=="/f" GOTO START4
IF "%1"=="/s" GOTO START2
IF "%1"=="/i" GOTO START5
IF "%1"=="/x" GOTO START6
IF NOT "%1"=="" GOTO START0
EXIT /B


:HELP
echo twitter [検索ワード]
echo twitter  [/f]
echo twitter  [/i]
echo twitter  [/x]
echo twitter  [/s]

echo /f from検索
echo /i image検索
echo /x from and image検索
echo /s フィルタの表示
GOTO :EOF

:START0
set line=%*
set line=%line: =+%
set search_keys=%line: =+%

start https://twitter.com/search?q=%search_keys%
GOTO :EOF

:START4
type twitter_user.txt

rem ユーザーが増えた場合以下の一行に変更
rem notepad.exe twitter_user.txt

echo ##################################################
set /p No="フロム検索する番号を入力してください。"
for /f "tokens=1,2,3 delims=," %%i in (twitter_user.txt) do IF %No%==%%i set TWITTER_USER=%%j
start https://twitter.com/search?q=from:%TWITTER_USER%
GOTO :EOF

:START6
type witter_user.txt

rem ユーザーが増えた場合以下の一行に変更
rem notepad.exe %UsbDrive%\RELEASE2.3\twitter_user.txt

echo ##################################################
set /p No="フロムandイメージ検索する番号を入力してください。"
for /f "tokens=1,2,3 delims=," %%i in (twitter_user.txt) do IF %No%==%%i set TWITTER_USER=%%j
start https://twitter.com/search?q=from:%TWITTER_USER%+filter:images
GOTO :EOF


:START5
set line=%*
set line=%line: =+%
set search_keys=%line: =+%

start https://twitter.com/search?q=filter:images+%search_keys%
GOTO :EOF

:START2
start http://kumo.site/document/txt/TwitterSearchCode.txt
GOTO :EOFF