@echo off

REM /t option twitter in AI MSG REPLAY
REM /r option twitter in SET ID AI MSG REPLAY

IF "%1"=="/r" chcp 65001
IF "%1"=="/t" chcp 932

:START

IF "%1"=="/r" GOTO :START2

set /p q="IN THE MSG:"

for /f "usebackq" %%A in (`openai api completions.create -m text-davinci-003 -p "%q%" -t 0 -M 140 --stream`) do set LINECOUNT=%%A

set LINECOUNT=%LINECOUNT%

echo %LINECOUNT%

python jtalk.py %LINECOUNT%

IF "%1"=="/t" GOTO :START1

GOTO :START

:START1

python OPEN_AI_TALK_TWITTER.py %q% %LINECOUNT%

GOTO :EOF

:START2

python AI_TALK_TWITTER_REPLAY.py

GOTO :EOF