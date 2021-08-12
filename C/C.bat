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
set /p KEY="鍵を二進法0000から1111迄で入力せよ:"
echo CODE ACTION
FOR /F "tokens=1,2,3,4" %%i IN (D_code.txt) DO IF "%%i"=="G" set BN=%%k && set x16=%%l && CALL :FUNCTION
FOR /F "tokens=1,2,3,4" %%i IN (D_code.txt) DO IF "%%i"=="B" set BN=%%k && set x16=%%l && CALL :FUNCTION
FOR /F "tokens=1,2,3,4" %%i IN (D_code.txt) DO IF "%%i"=="J" set BN=%%k && set x16=%%l && CALL :FUNCTION
FOR /F "tokens=1,2,3,4" %%i IN (D_code.txt) DO IF "%%i"=="E" set BN=%%k && set x16=%%l && CALL :FUNCTION
FOR /F "tokens=1,2,3,4" %%i IN (D_code.txt) DO IF "%%i"=="C" set BN=%%k && set x16=%%l && CALL :FUNCTION
FOR /F "tokens=1,2,3,4" %%i IN (D_code.txt) DO IF "%%i"=="A" set BN=%%k && set x16=%%l && CALL :FUNCTION
FOR /F "tokens=1,2,3,4" %%i IN (D_code.txt) DO IF "%%i"=="I" set BN=%%k && set x16=%%l && CALL :FUNCTION
FOR /F "tokens=1,2,3,4" %%i IN (D_code.txt) DO IF "%%i"=="H" set BN=%%k && set x16=%%l && CALL :FUNCTION
FOR /F "tokens=1,2,3,4" %%i IN (D_code.txt) DO IF "%%i"=="D" set BN=%%k && set x16=%%l && CALL :FUNCTION
FOR /F "tokens=1,2,3,4" %%i IN (D_code.txt) DO IF "%%i"=="F" set BN=%%k && set x16=%%l && CALL :FUNCTION
FOR /F "tokens=1,2,3,4" %%i IN (D_code.txt) DO IF "%%i"=="P" set BN=%%k && set x16=%%l && CALL :FUNCTION
FOR /F "tokens=1,2,3,4" %%i IN (D_code.txt) DO IF "%%i"=="O" set BN=%%k && set x16=%%l && CALL :FUNCTION
FOR /F "tokens=1,2,3,4" %%i IN (D_code.txt) DO IF "%%i"=="L" set BN=%%k && set x16=%%l && CALL :FUNCTION
FOR /F "tokens=1,2,3,4" %%i IN (D_code.txt) DO IF "%%i"=="N" set BN=%%k && set x16=%%l && CALL :FUNCTION
FOR /F "tokens=1,2,3,4" %%i IN (D_code.txt) DO IF "%%i"=="M" set BN=%%k && set x16=%%l && CALL :FUNCTION
FOR /F "tokens=1,2,3,4" %%i IN (D_code.txt) DO IF "%%i"=="K" set BN=%%k && set x16=%%l && CALL :FUNCTION
echo Please teach me CODE.
GOTO :EOF

:FUNCTION
IF %BN:~0,1%==%KEY:~0,1% (set ZERO=0) ELSE (set ZERO=1)
IF %BN:~1,1%==%KEY:~1,1% (set ONE=0) ELSE (set ONE=1)
IF %BN:~2,1%==%KEY:~2,1% (set TWO=0) ELSE (set TWO=1)
IF %BN:~3,1%==%KEY:~3,1% (set THREE=0) ELSE (set THREE=1)
IF %ZERO%%ONE%%TWO%%THREE%==0010 echo %x16% メールで連絡せよ
IF %ZERO%%ONE%%TWO%%THREE%==1110 echo %x16% 電話で連絡せよ
IF %ZERO%%ONE%%TWO%%THREE%==0110 echo %x16% 今から向かう
IF %ZERO%%ONE%%TWO%%THREE%==0000 echo %x16% ###
IF %ZERO%%ONE%%TWO%%THREE%==0001 echo %x16% ###
IF %ZERO%%ONE%%TWO%%THREE%==0111 echo %x16% ###
IF %ZERO%%ONE%%TWO%%THREE%==1111 echo %x16% ###
IF %ZERO%%ONE%%TWO%%THREE%==1000 echo %x16% ###
IF %ZERO%%ONE%%TWO%%THREE%==0100 echo %x16% ###
IF %ZERO%%ONE%%TWO%%THREE%==1100 echo %x16% ###
IF %ZERO%%ONE%%TWO%%THREE%==1101 echo %x16% ###
IF %ZERO%%ONE%%TWO%%THREE%==1001 echo %x16% ###
IF %ZERO%%ONE%%TWO%%THREE%==0101 echo %x16% ###
IF %ZERO%%ONE%%TWO%%THREE%==1010 echo %x16% ###
IF %ZERO%%ONE%%TWO%%THREE%==0011 echo %x16% ###
IF %ZERO%%ONE%%TWO%%THREE%==1011 echo %x16% ###

GOTO :EOF
