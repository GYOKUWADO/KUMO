@echo off

REM /t option twitter in AI MSG REPLAY
REM /r option twitter in SET ID AI MSG REPLAY

chcp 65001

:START

IF "%1"=="/r" GOTO :START2

set /p q="IN THE MSG:"

for /f "usebackq" %%A in (`curl -s -X POST https://api.a3rt.recruit.co.jp/talk/v1/smalltalk -F "apikey=DZZE7NQfPP5wdpwFiw7k7Z5SRjD7tXY3" -F "query=%q%" ^| jq -c .results[].reply`) do set LINECOUNT=%%A

set LINECOUNT=%LINECOUNT:~1,-1%

echo %LINECOUNT%

REM curl -s -X POST https://api.a3rt.recruit.co.jp/talk/v1/smalltalk -F "apikey=###your api key in this site https://a3rt.recruit.co.jp/product/talkAPI/ ###" -F "query=%q%" | jq -c .results[].reply

python jtalk.py %LINECOUNT%

IF "%1"=="/t" GOTO :START1

GOTO :START

:START1

python AI_TALK_TWITTER.py %q% %LINECOUNT%

GOTO :EOF

:START2

python AI_TALK_TWITTER_REPLAY.py

GOTO :EOF