@echo off

TITLE TwitterSearh in cmd
IF "%1"=="" GOTO :HELP
IF "%1"=="/t" GOTO :START1
IF "%1"=="/f" GOTO :START4
IF "%1"=="/s" GOTO :START2
IF "%1"=="/i" GOTO :START5
IF "%1"=="/x" GOTO :START6
IF NOT "%1"=="" GOTO :START0
EXIT /B


:HELP
echo twitter [�������[�h]
echo twitter [/t] [�������[�h]
echo twitter [/f]
echo twitter [/i]
echo twitter [/x]
echo twitter [/s]
echo #################################
echo /t �V�����ӂ̌���
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

:START1
start https://twitter.com/search?q=geocode:34.588946,135.800122,3.0km+%2
GOTO :EOF

:START4

echo ##################################################
set /p TWITTER_USER="��������ID����͂��Ă��������B"
start https://twitter.com/search?q=from:%TWITTER_USER%
GOTO :EOF

:START6
type twitter_user.txt

rem ���[�U�[���������ꍇ�ȉ��̈�s�ɕύX
rem notepad.exe %UsbDrive%\RELEASE2.3\twitter_user.txt

echo ##################################################
set /p No="��������ID����͂��Ă��������B"
start https://twitter.com/search?q=from:%TWITTER_USER%+filter:images
GOTO :EOF


:START5
set line=%2 %3 %4 %5 %6 %7 %8 %9 
set line=%line: =+%
set search_keys=%line: =+%

start https://twitter.com/search?q=filter:images+%search_keys%
GOTO :EOF

:START2
start http://kumo.site/document/txt/TwitterSearchCode.txt
GOTO :EOF