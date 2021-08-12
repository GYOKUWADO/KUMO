@echo off
TITLE C_code in SOUL

IF "%1"=="" GOTO :HELP
IF "%1"=="/e" GOTO START1
IF "%1"=="/d" GOTO START2
IF "%1"=="/s" GOTO START3
IF "%1"=="/c" python chenge_code.py
IF "%1"=="/" GOTO START6
GOTO :EOF

:HELP
echo /e C_codeの暗号化
echo /d C_codeの復号化
echo /s D_codeの復号
echo /c 合言葉の変更
GOTO :EOF

:START1
gpg -e -r B8248E76756CA8A798733B61024029A14BAD543E C_code.txt
sdelete -p 5 C_code.txt
GOTO :EOF

:START2
gpg -d C_code.txt.gpg > C_code.txt
GOTO :EOF

:START3
set /p CODE="合言葉を漢字一文字で入力せよ:"
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %CODE%==%%j set JIS=%%i
IF "%JIS%"=="3828" GOTO START4
GOTO :EOF

:START4
set No=1
set /p KEY="鍵を二進法0000から1111迄で入力せよ:"
echo CODE ACTION
FOR /F "tokens=1,2,3,4" %%i IN (D_code.txt) DO IF "%%i"=="G" set BN=%%k && set x=%%l && CALL :FUNCTION
FOR /F "tokens=1,2,3,4" %%i IN (D_code.txt) DO IF "%%i"=="B" set BN=%%k && set x=%%l && CALL :FUNCTION
FOR /F "tokens=1,2,3,4" %%i IN (D_code.txt) DO IF "%%i"=="J" set BN=%%k && set x=%%l && CALL :FUNCTION
FOR /F "tokens=1,2,3,4" %%i IN (D_code.txt) DO IF "%%i"=="E" set BN=%%k && set x=%%l && CALL :FUNCTION
FOR /F "tokens=1,2,3,4" %%i IN (D_code.txt) DO IF "%%i"=="C" set BN=%%k && set x=%%l && CALL :FUNCTION
FOR /F "tokens=1,2,3,4" %%i IN (D_code.txt) DO IF "%%i"=="A" set BN=%%k && set x=%%l && CALL :FUNCTION
FOR /F "tokens=1,2,3,4" %%i IN (D_code.txt) DO IF "%%i"=="I" set BN=%%k && set x=%%l && CALL :FUNCTION
FOR /F "tokens=1,2,3,4" %%i IN (D_code.txt) DO IF "%%i"=="H" set BN=%%k && set x=%%l && CALL :FUNCTION
FOR /F "tokens=1,2,3,4" %%i IN (D_code.txt) DO IF "%%i"=="D" set BN=%%k && set x=%%l && CALL :FUNCTION
FOR /F "tokens=1,2,3,4" %%i IN (D_code.txt) DO IF "%%i"=="F" set BN=%%k && set x=%%l && CALL :FUNCTION
FOR /F "tokens=1,2,3,4" %%i IN (D_code.txt) DO IF "%%i"=="P" set BN=%%k && set x=%%l && CALL :FUNCTION
FOR /F "tokens=1,2,3,4" %%i IN (D_code.txt) DO IF "%%i"=="O" set BN=%%k && set x=%%l && CALL :FUNCTION
FOR /F "tokens=1,2,3,4" %%i IN (D_code.txt) DO IF "%%i"=="L" set BN=%%k && set x=%%l && CALL :FUNCTION
FOR /F "tokens=1,2,3,4" %%i IN (D_code.txt) DO IF "%%i"=="N" set BN=%%k && set x=%%l && CALL :FUNCTION
FOR /F "tokens=1,2,3,4" %%i IN (D_code.txt) DO IF "%%i"=="M" set BN=%%k && set x=%%l && CALL :FUNCTION
FOR /F "tokens=1,2,3,4" %%i IN (D_code.txt) DO IF "%%i"=="K" set BN=%%k && set x=%%l && CALL :FUNCTION
echo Please teach me CODE.
GOTO :EOF

:FUNCTION
IF %BN:~0,1%==%KEY:~0,1% (set ZERO=0) ELSE (set ZERO=1)
IF %BN:~1,1%==%KEY:~1,1% (set ONE=0) ELSE (set ONE=1)
IF %BN:~2,1%==%KEY:~2,1% (set TWO=0) ELSE (set TWO=1)
IF %BN:~3,1%==%KEY:~3,1% (set THREE=0) ELSE (set THREE=1)
CALL :FUNCTION%No%
IF %ZERO%%ONE%%TWO%%THREE%==0010 echo %x:~0,1%%D:~0,2% メールで連絡せよ
IF %ZERO%%ONE%%TWO%%THREE%==1110 echo %x:~0,1%%D:~0,2% 電話で連絡せよ
IF %ZERO%%ONE%%TWO%%THREE%==0110 echo %x:~0,1%%D:~0,2% 今から向かう
IF %ZERO%%ONE%%TWO%%THREE%==0000 echo %x:~0,1%%D:~0,2% ###
IF %ZERO%%ONE%%TWO%%THREE%==0001 echo %x:~0,1%%D:~0,2% ###
IF %ZERO%%ONE%%TWO%%THREE%==0111 echo %x:~0,1%%D:~0,2% ###
IF %ZERO%%ONE%%TWO%%THREE%==1111 echo %x:~0,1%%D:~0,2% ###
IF %ZERO%%ONE%%TWO%%THREE%==1000 echo %x:~0,1%%D:~0,2% ###
IF %ZERO%%ONE%%TWO%%THREE%==0100 echo %x:~0,1%%D:~0,2% ###
IF %ZERO%%ONE%%TWO%%THREE%==1100 echo %x:~0,1%%D:~0,2% ###
IF %ZERO%%ONE%%TWO%%THREE%==1101 echo %x:~0,1%%D:~0,2% ###
IF %ZERO%%ONE%%TWO%%THREE%==1001 echo %x:~0,1%%D:~0,2% ###
IF %ZERO%%ONE%%TWO%%THREE%==0101 echo %x:~0,1%%D:~0,2% ###
IF %ZERO%%ONE%%TWO%%THREE%==1010 echo %x:~0,1%%D:~0,2% ###
IF %ZERO%%ONE%%TWO%%THREE%==0011 echo %x:~0,1%%D:~0,2% ###
IF %ZERO%%ONE%%TWO%%THREE%==1011 echo %x:~0,1%%D:~0,2% ###
set /A No=%No%+1
GOTO :EOF

:FUNCTION1
FOR /F "tokens=1,2,3,4,5" %%i IN (D_code.txt) DO IF "%%m"=="04" set D=08
GOTO :EOF

:FUNCTION2
FOR /F "tokens=1,2,3,4,5" %%i IN (D_code.txt) DO IF "%%m"=="01" set D=05
GOTO :EOF

:FUNCTION3
FOR /F "tokens=1,2,3,4,5" %%i IN (D_code.txt) DO IF "%%m"=="13" set D=01
GOTO :EOF

:FUNCTION4
FOR /F "tokens=1,2,3,4,5" %%i IN (D_code.txt) DO IF "%%m"=="06" set D=10
GOTO :EOF

:FUNCTION5
FOR /F "tokens=1,2,3,4,5" %%i IN (D_code.txt) DO IF "%%m"=="14" set D=02
GOTO :EOF

:FUNCTION6
FOR /F "tokens=1,2,3,4,5" %%i IN (D_code.txt) DO IF "%%m"=="12" set D=00
GOTO :EOF

:FUNCTION7
FOR /F "tokens=1,2,3,4,5" %%i IN (D_code.txt) DO IF "%%m"=="15" set D=03
GOTO :EOF

:FUNCTION8
FOR /F "tokens=1,2,3,4,5" %%i IN (D_code.txt) DO IF "%%m"=="00" set D=04
GOTO :EOF

:FUNCTION9
FOR /F "tokens=1,2,3,4,5" %%i IN (D_code.txt) DO IF "%%m"=="07" set D=11
GOTO :EOF

:FUNCTION10
FOR /F "tokens=1,2,3,4,5" %%i IN (D_code.txt) DO IF "%%m"=="08" set D=12
GOTO :EOF

:FUNCTION11
FOR /F "tokens=1,2,3,4,5" %%i IN (D_code.txt) DO IF "%%m"=="11" set D=15
GOTO :EOF

:FUNCTION12
FOR /F "tokens=1,2,3,4,5" %%i IN (D_code.txt) DO IF "%%m"=="02" set D=06
GOTO :EOF

:FUNCTION13
FOR /F "tokens=1,2,3,4,5" %%i IN (D_code.txt) DO IF "%%m"=="10" set D=14
GOTO :EOF

:FUNCTION14
FOR /F "tokens=1,2,3,4,5" %%i IN (D_code.txt) DO IF "%%m"=="03" set D=07
GOTO :EOF

:FUNCTION15
FOR /F "tokens=1,2,3,4,5" %%i IN (D_code.txt) DO IF "%%m"=="05" set D=09
GOTO :EOF

:FUNCTION16
FOR /F "tokens=1,2,3,4,5" %%i IN (D_code.txt) DO IF "%%m"=="09" set D=13
GOTO :EOF