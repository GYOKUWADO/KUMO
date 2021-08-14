@echo off
TITLE C_code in SOUL

IF "%1"=="" GOTO :HELP
IF "%1"=="/e" GOTO START1
IF "%1"=="/d" GOTO START2
IF "%1"=="/s" GOTO START3
IF "%1"=="/j" GOTO START5
IF "%1"=="/" GOTO START6
GOTO :EOF

:HELP
echo /e C_codeの暗号化
echo /d C_codeの復号化
echo /s D_codeの復号
echo /j 文字列のCODE化
GOTO :EOF

:START1
gpg -e -r B8248E76756CA8A798733B61024029A14BAD543E C_code.txt
sdelete -p 5 C_code.txt
GOTO :EOF

:START2
gpg -d C_code.txt.gpg > C_code.txt
GOTO :EOF

:START7
set /p CODE="変更する合言葉の漢字一文字を入力せよ:"
for /f "skip=4 tokens=4,8" %%i in (JIS.txt) do if %CODE%==%%j set S=%%i
set S=%S:~2,2%%S:~0,2%
echo %S% > F_code.txt
CALL R
GOTO :EOF

:START4
set No=1
set /p KEY="鍵を二進法0000から1111迄で入力せよ:"
REM echo CODE ACTION
CALL :FUNCTION17

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
CALL R
echo Please teach me CODE.
GOTO :EOF

:FUNCTION
IF %BN:~0,1%==%KEY:~0,1% (set ZERO=0) ELSE (set ZERO=1)
IF %BN:~1,1%==%KEY:~1,1% (set ONE=0) ELSE (set ONE=1)
IF %BN:~2,1%==%KEY:~2,1% (set TWO=0) ELSE (set TWO=1)
IF %BN:~3,1%==%KEY:~3,1% (set THREE=0) ELSE (set THREE=1)

GOTO :A

REM 強度が下がるので:Aまでエスケープする。
CALL :FUNCTION%No%
IF %ZERO%%ONE%%TWO%%THREE%==0010 echo CODE IS %x:~0,1%%D:~0,2% && CALL FUNCTION18
IF %ZERO%%ONE%%TWO%%THREE%==1110 echo CODE IS %x:~0,1%%D:~0,2% && CALL FUNCTION19
IF %ZERO%%ONE%%TWO%%THREE%==0110 echo CODE IS %x:~0,1%%D:~0,2% && CALL FUNCTION20
IF %ZERO%%ONE%%TWO%%THREE%==0000 echo CODE IS %x:~0,1%%D:~0,2% && CALL FUNCTION21
IF %ZERO%%ONE%%TWO%%THREE%==0001 echo CODE IS %x:~0,1%%D:~0,2% && CALL FUNCTION22
IF %ZERO%%ONE%%TWO%%THREE%==0111 echo CODE IS %x:~0,1%%D:~0,2% && CALL FUNCTION23
IF %ZERO%%ONE%%TWO%%THREE%==1111 echo CODE IS %x:~0,1%%D:~0,2% && CALL FUNCTION24
IF %ZERO%%ONE%%TWO%%THREE%==1000 echo CODE IS %x:~0,1%%D:~0,2% && CALL FUNCTION25
IF %ZERO%%ONE%%TWO%%THREE%==0100 echo CODE IS %x:~0,1%%D:~0,2% && CALL FUNCTION26
IF %ZERO%%ONE%%TWO%%THREE%==1100 echo CODE IS %x:~0,1%%D:~0,2% && CALL FUNCTION27
IF %ZERO%%ONE%%TWO%%THREE%==1101 echo CODE IS %x:~0,1%%D:~0,2% && CALL FUNCTION28
IF %ZERO%%ONE%%TWO%%THREE%==1001 echo CODE IS %x:~0,1%%D:~0,2% && CALL FUNCTION29
IF %ZERO%%ONE%%TWO%%THREE%==0101 echo CODE IS %x:~0,1%%D:~0,2% && CALL FUNCTION30
IF %ZERO%%ONE%%TWO%%THREE%==1010 echo CODE IS %x:~0,1%%D:~0,2% && CALL FUNCTION31
IF %ZERO%%ONE%%TWO%%THREE%==0011 echo CODE IS %x:~0,1%%D:~0,2% && CALL FUNCTION32
IF %ZERO%%ONE%%TWO%%THREE%==1011 echo CODE IS %x:~0,1%%D:~0,2% && CALL FUNCTION33
set /A No=%No%+1

:A
IF %ZERO%%ONE%%TWO%%THREE%==0010 echo CODE IS %x:~0,1% && CALL FUNCTION18
IF %ZERO%%ONE%%TWO%%THREE%==1110 echo CODE IS %x:~0,1% && CALL FUNCTION19
IF %ZERO%%ONE%%TWO%%THREE%==0110 echo CODE IS %x:~0,1% && CALL FUNCTION20
IF %ZERO%%ONE%%TWO%%THREE%==0000 echo CODE IS %x:~0,1% && CALL FUNCTION21
IF %ZERO%%ONE%%TWO%%THREE%==0001 echo CODE IS %x:~0,1% && CALL FUNCTION22
IF %ZERO%%ONE%%TWO%%THREE%==0111 echo CODE IS %x:~0,1% && CALL FUNCTION23
IF %ZERO%%ONE%%TWO%%THREE%==1111 echo CODE IS %x:~0,1% && CALL FUNCTION24
IF %ZERO%%ONE%%TWO%%THREE%==1000 echo CODE IS %x:~0,1% && CALL FUNCTION25
IF %ZERO%%ONE%%TWO%%THREE%==0100 echo CODE IS %x:~0,1% && CALL FUNCTION26
IF %ZERO%%ONE%%TWO%%THREE%==1100 echo CODE IS %x:~0,1% && CALL FUNCTION27
IF %ZERO%%ONE%%TWO%%THREE%==1101 echo CODE IS %x:~0,1% && CALL FUNCTION28
IF %ZERO%%ONE%%TWO%%THREE%==1001 echo CODE IS %x:~0,1% && CALL FUNCTION29
IF %ZERO%%ONE%%TWO%%THREE%==0101 echo CODE IS %x:~0,1% && CALL FUNCTION30
IF %ZERO%%ONE%%TWO%%THREE%==1010 echo CODE IS %x:~0,1% && CALL FUNCTION31
IF %ZERO%%ONE%%TWO%%THREE%==0011 echo CODE IS %x:~0,1% && CALL FUNCTION32
IF %ZERO%%ONE%%TWO%%THREE%==1011 echo CODE IS %x:~0,1% && CALL FUNCTION33

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

:START5
set /p One_Word="二十文字以内で文字を入力してください。二十一文字以降はカットされます。日本語のみ対応:"

IF "%One_Word%"=="" GOTO :STRAT5

:X
FOR /L %%i IN (0,1,19) DO set JISCODE%%i=""

set JIS0=%One_Word:~0,1%
set JIS1=%One_Word:~1,1%
set JIS2=%One_Word:~2,1%
set JIS3=%One_Word:~3,1%
set JIS4=%One_Word:~4,1%
set JIS5=%One_Word:~5,1%
set JIS6=%One_Word:~6,1%
set JIS7=%One_Word:~7,1%
set JIS8=%One_Word:~8,1%
set JIS9=%One_Word:~9,1%
set JIS10=%One_Word:~10,1%
set JIS11=%One_Word:~11,1%
set JIS12=%One_Word:~12,1%
set JIS13=%One_Word:~13,1%
set JIS14=%One_Word:~14,1%
set JIS15=%One_Word:~15,1%
set JIS16=%One_Word:~16,1%
set JIS17=%One_Word:~17,1%
set JIS18=%One_Word:~18,1%
set JIS19=%One_Word:~19,1%

set One_Word=

for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %JIS0%==%%j set JISCODE0=%%i
for /f "skip=4 tokens=3,6" %%i in (JIS.txt) do if %JIS0%==%%j set JISCODE0=%%i
IF "%JIS1%" == "" GOTO :END
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %JIS1%==%%j set JISCODE1=%%i
for /f "skip=4 tokens=3,6" %%i in (JIS.txt) do if %JIS1%==%%j set JISCODE1=%%i
IF "%JIS2%" == "" GOTO :END
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %JIS2%==%%j set JISCODE2=%%i
for /f "skip=4 tokens=3,6" %%i in (JIS.txt) do if %JIS2%==%%j set JISCODE2=%%i
IF "%JIS3%" == "" GOTO :END
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %JIS3%==%%j set JISCODE3=%%i
for /f "skip=4 tokens=3,6" %%i in (JIS.txt) do if %JIS3%==%%j set JISCODE3=%%i
IF "%JIS4%" == "" GOTO :END
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %JIS4%==%%j set JISCODE4=%%i
for /f "skip=4 tokens=3,6" %%i in (JIS.txt) do if %JIS4%==%%j set JISCODE4=%%i
IF "%JIS5%" == "" GOTO :END
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %JIS5%==%%j set JISCODE5=%%i
for /f "skip=4 tokens=3,6" %%i in (JIS.txt) do if %JIS5%==%%j set JISCODE5=%%i
IF "%JIS6%" == "" GOTO :END
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %JIS6%==%%j set JISCODE6=%%i
for /f "skip=4 tokens=3,6" %%i in (JIS.txt) do if %JIS6%==%%j set JISCODE6=%%i
IF "%JIS7%" == "" GOTO :END
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %JIS7%==%%j set JISCODE7=%%i
for /f "skip=4 tokens=3,6" %%i in (JIS.txt) do if %JIS7%==%%j set JISCODE7=%%i
IF "%JIS8%" == "" GOTO :END
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %JIS8%==%%j set JISCODE8=%%i
for /f "skip=4 tokens=3,6" %%i in (JIS.txt) do if %JIS8%==%%j set JISCODE8=%%i
IF "%JIS9%" == "" GOTO :END
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %JIS9%==%%j set JISCODE9=%%i
for /f "skip=4 tokens=3,6" %%i in (JIS.txt) do if %JIS9%==%%j set JISCODE9=%%i
IF "%JIS10%" == "" GOTO :END
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %JIS10%==%%j set JISCODE10=%%i
for /f "skip=4 tokens=3,6" %%i in (JIS.txt) do if %JIS10%==%%j set JISCODE10=%%i
IF "%JIS11%" == "" GOTO :END
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %JIS11%==%%j set JISCODE11=%%i
for /f "skip=4 tokens=3,6" %%i in (JIS.txt) do if %JIS11%==%%j set JISCODE11=%%i
IF "%JIS12%" == "" GOTO :END
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %JIS12%==%%j set JISCODE12=%%i
for /f "skip=4 tokens=3,6" %%i in (JIS.txt) do if %JIS12%==%%j set JISCODE12=%%i
IF "%JIS13%" == "" GOTO :END
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %JIS13%==%%j set JISCODE13=%%i
for /f "skip=4 tokens=3,6" %%i in (JIS.txt) do if %JIS13%==%%j set JISCODE13=%%i
IF "%JIS14%" == "" GOTO :END
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %JIS14%==%%j set JISCODE14=%%i
for /f "skip=4 tokens=3,6" %%i in (JIS.txt) do if %JIS14%==%%j set JISCODE14=%%i
IF "%JIS15%" == "" GOTO :END
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %JIS15%==%%j set JISCODE15=%%i
for /f "skip=4 tokens=3,6" %%i in (JIS.txt) do if %JIS15%==%%j set JISCODE15=%%i
IF "%JIS16%" == "" GOTO :END
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %JIS16%==%%j set JISCODE16=%%i
for /f "skip=4 tokens=3,6" %%i in (JIS.txt) do if %JIS16%==%%j set JISCODE16=%%i
IF "%JIS17%" == "" GOTO :END
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %JIS17%==%%j set JISCODE17=%%i
for /f "skip=4 tokens=3,6" %%i in (JIS.txt) do if %JIS17%==%%j set JISCODE17=%%i
IF "%JIS18%" == "" GOTO :END
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %JIS18%==%%j set JISCODE18=%%i
for /f "skip=4 tokens=3,6" %%i in (JIS.txt) do if %JIS18%==%%j set JISCODE18=%%i
IF "%JIS19%" == "" GOTO :END
for /f "skip=4 tokens=3,8" %%i in (JIS.txt) do if %JIS19%==%%j set JISCODE19=%%i
for /f "skip=4 tokens=3,6" %%i in (JIS.txt) do if %JIS19%==%%j set JISCODE19=%%i
IF "%JIS20%" == "" GOTO :END

:END
IF %JISCODE0%=="" set JISCODE0=####
IF %JISCODE1%=="" set JISCODE1=####
IF %JISCODE2%=="" set JISCODE2=####
IF %JISCODE3%=="" set JISCODE3=####
IF %JISCODE4%=="" set JISCODE4=####
IF %JISCODE5%=="" set JISCODE5=####
IF %JISCODE6%=="" set JISCODE6=####
IF %JISCODE7%=="" set JISCODE7=####
IF %JISCODE8%=="" set JISCODE8=####
IF %JISCODE9%=="" set JISCODE9=####
IF %JISCODE10%=="" set JISCODE10=####
IF %JISCODE11%=="" set JISCODE11=####
IF %JISCODE12%=="" set JISCODE12=####
IF %JISCODE13%=="" set JISCODE13=####
IF %JISCODE14%=="" set JISCODE14=####
IF %JISCODE15%=="" set JISCODE15=####
IF %JISCODE16%=="" set JISCODE16=####
IF %JISCODE17%=="" set JISCODE17=####
IF %JISCODE18%=="" set JISCODE18=####
IF %JISCODE19%=="" set JISCODE19=####

REM echo %JISCODE0%:%JISCODE1%:%JISCODE2%:%JISCODE3%:%JISCODE4%:%JISCODE5%:%JISCODE6%:%JISCODE7%:%JISCODE8%:%JISCODE9%:%JISCODE10%:%JISCODE11%:%JISCODE12%:%JISCODE13%:%JISCODE14%:%JISCODE15%:%JISCODE16%:%JISCODE17%:%JISCODE18%:%JISCODE19%

CALL FUNCTION35

echo %JISCODE0:~2,2%%JISCODE0:~0,2%:%JISCODE1:~2,2%%JISCODE1:~0,2%:%JISCODE2:~2,2%%JISCODE2:~0,2%:%JISCODE3:~2,2%%JISCODE3:~0,2%:%JISCODE4:~2,2%%JISCODE4:~0,2%:%JISCODE5:~2,2%%JISCODE5:~0,2%:%JISCODE6:~2,2%%JISCODE6:~0,2%:%JISCODE7:~2,2%%JISCODE7:~0,2%:%JISCODE8:~2,2%%JISCODE8:~0,2%:%JISCODE9:~2,2%%JISCODE9:~0,2%:%JISCODE10:~2,2%%JISCODE10:~0,2%:%JISCODE11:~2,2%%JISCODE11:~0,2%:%JISCODE12:~2,2%%JISCODE12:~0,2%:%JISCODE13:~2,2%%JISCODE13:~0,2%:%JISCODE14:~2,2%%JISCODE14:~0,2%:%JISCODE15:~2,2%%JISCODE15:~0,2%:%JISCODE16:~2,2%%JISCODE16:~0,2%:%JISCODE17:~2,2%%JISCODE17:~0,2%:%JISCODE18:~2,2%%JISCODE18:~0,2%:%JISCODE19:~2,2%%JISCODE19:~0,2%

CALL R

GOTO :EOF

:FUNCTION17
FOR /F "tokens=1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21 delims=: " %%a IN (E_code.txt) DO IF %%a==00 set LPJ0=%%b:%%c:%%d:%%e:%%f:%%g:%%h:%%i:%%j:%%k:%%l:%%m:%%n:%%o:%%p:%%q:%%r:%%s:%%t:%%u
FOR /F "tokens=1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21 delims=: " %%a IN (E_code.txt) DO IF %%a==01 set LPJ1=%%b:%%c:%%d:%%e:%%f:%%g:%%h:%%i:%%j:%%k:%%l:%%m:%%n:%%o:%%p:%%q:%%r:%%s:%%t:%%u
FOR /F "tokens=1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21 delims=: " %%a IN (E_code.txt) DO IF %%a==02 set LPJ2=%%b:%%c:%%d:%%e:%%f:%%g:%%h:%%i:%%j:%%k:%%l:%%m:%%n:%%o:%%p:%%q:%%r:%%s:%%t:%%u
FOR /F "tokens=1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21 delims=: " %%a IN (E_code.txt) DO IF %%a==03 set LPJ3=%%b:%%c:%%d:%%e:%%f:%%g:%%h:%%i:%%j:%%k:%%l:%%m:%%n:%%o:%%p:%%q:%%r:%%s:%%t:%%u
FOR /F "tokens=1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21 delims=: " %%a IN (E_code.txt) DO IF %%a==04 set LPJ4=%%b:%%c:%%d:%%e:%%f:%%g:%%h:%%i:%%j:%%k:%%l:%%m:%%n:%%o:%%p:%%q:%%r:%%s:%%t:%%u
FOR /F "tokens=1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21 delims=: " %%a IN (E_code.txt) DO IF %%a==05 set LPJ5=%%b:%%c:%%d:%%e:%%f:%%g:%%h:%%i:%%j:%%k:%%l:%%m:%%n:%%o:%%p:%%q:%%r:%%s:%%t:%%u
FOR /F "tokens=1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21 delims=: " %%a IN (E_code.txt) DO IF %%a==06 set LPJ6=%%b:%%c:%%d:%%e:%%f:%%g:%%h:%%i:%%j:%%k:%%l:%%m:%%n:%%o:%%p:%%q:%%r:%%s:%%t:%%u
FOR /F "tokens=1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21 delims=: " %%a IN (E_code.txt) DO IF %%a==07 set LPJ7=%%b:%%c:%%d:%%e:%%f:%%g:%%h:%%i:%%j:%%k:%%l:%%m:%%n:%%o:%%p:%%q:%%r:%%s:%%t:%%u
FOR /F "tokens=1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21 delims=: " %%a IN (E_code.txt) DO IF %%a==08 set LPJ8=%%b:%%c:%%d:%%e:%%f:%%g:%%h:%%i:%%j:%%k:%%l:%%m:%%n:%%o:%%p:%%q:%%r:%%s:%%t:%%u
FOR /F "tokens=1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21 delims=: " %%a IN (E_code.txt) DO IF %%a==09 set LPJ9=%%b:%%c:%%d:%%e:%%f:%%g:%%h:%%i:%%j:%%k:%%l:%%m:%%n:%%o:%%p:%%q:%%r:%%s:%%t:%%u
FOR /F "tokens=1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21 delims=: " %%a IN (E_code.txt) DO IF %%a==10 set LPJ10=%%b:%%c:%%d:%%e:%%f:%%g:%%h:%%i:%%j:%%k:%%l:%%m:%%n:%%o:%%p:%%q:%%r:%%s:%%t:%%u
FOR /F "tokens=1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21 delims=: " %%a IN (E_code.txt) DO IF %%a==11 set LPJ11=%%b:%%c:%%d:%%e:%%f:%%g:%%h:%%i:%%j:%%k:%%l:%%m:%%n:%%o:%%p:%%q:%%r:%%s:%%t:%%u
FOR /F "tokens=1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21 delims=: " %%a IN (E_code.txt) DO IF %%a==12 set LPJ12=%%b:%%c:%%d:%%e:%%f:%%g:%%h:%%i:%%j:%%k:%%l:%%m:%%n:%%o:%%p:%%q:%%r:%%s:%%t:%%u
FOR /F "tokens=1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21 delims=: " %%a IN (E_code.txt) DO IF %%a==13 set LPJ13=%%b:%%c:%%d:%%e:%%f:%%g:%%h:%%i:%%j:%%k:%%l:%%m:%%n:%%o:%%p:%%q:%%r:%%s:%%t:%%u
FOR /F "tokens=1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21 delims=: " %%a IN (E_code.txt) DO IF %%a==14 set LPJ14=%%b:%%c:%%d:%%e:%%f:%%g:%%h:%%i:%%j:%%k:%%l:%%m:%%n:%%o:%%p:%%q:%%r:%%s:%%t:%%u
FOR /F "tokens=1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21 delims=: " %%a IN (E_code.txt) DO IF %%a==15 set LPJ15=%%b:%%c:%%d:%%e:%%f:%%g:%%h:%%i:%%j:%%k:%%l:%%m:%%n:%%o:%%p:%%q:%%r:%%s:%%t:%%u
CALL SIJ

REM CALL FUNCTION36

GOTO :EOF