@echo off

:START

set /p q="IN THE MSG:"

for /f "usebackq" %%A in (`curl -s -X POST https://api.a3rt.recruit.co.jp/talk/v1/smalltalk -F "apikey=DZZE7NQfPP5wdpwFiw7k7Z5SRjD7tXY3" -F "query=%q%" ^| jq -c .results[].reply`) do set LINECOUNT=%%A

set LINECOUNT=%LINECOUNT:~1,-1%

echo %LINECOUNT%

REM curl -s -X POST https://api.a3rt.recruit.co.jp/talk/v1/smalltalk -F "apikey=" -F "query=%q%" | jq -c .results[].reply

python jtalk.py %LINECOUNT%

GOTO :START