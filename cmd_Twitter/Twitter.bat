REM 37�s�ڂ̃e�L�X�g�Ƀ��X�g���쐬���Ă��������B

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
echo twitter [�������[�h]
echo twitter  [/f]
echo twitter  [/i]
echo twitter  [/x]
echo twitter  [/s]

echo /f from����
echo /i image����
echo /x from and image����
echo /s �t�B���^�̕\��
GOTO :EOF

:START0
set line=%*
set line=%line: =+%
set search_keys=%line: =+%

start https://twitter.com/search?q=%search_keys%
GOTO :EOF

:START4
type twitter_user.txt

rem ���[�U�[���������ꍇ�ȉ��̈�s�ɕύX
rem notepad.exe twitter_user.txt

echo ##################################################
set /p No="�t������������ԍ�����͂��Ă��������B"
for /f "tokens=1,2,3 delims=," %%i in (twitter_user.txt) do IF %No%==%%i set TWITTER_USER=%%j
start https://twitter.com/search?q=from:%TWITTER_USER%
GOTO :EOF

:START6
type witter_user.txt

rem ���[�U�[���������ꍇ�ȉ��̈�s�ɕύX
rem notepad.exe %UsbDrive%\RELEASE2.3\twitter_user.txt

echo ##################################################
set /p No="�t����and�C���[�W��������ԍ�����͂��Ă��������B"
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