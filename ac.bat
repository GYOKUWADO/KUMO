@echo off
IF "%1"=="" GOTO :HELP
IF "%1"=="/a" GOTO :START1
IF "%1"=="/d" GOTO :START2
GOTO :EOF
:HELP
echo ac /a
echo ac /d
echo #########
echo /a ユーザーアカウントの追加
echo /d ユーザーアカウントの削除
GOTO :EOF
:START1

set /p account="追加するユーザーアカウント名を入力してください。"
REM echo %account%
net user %account% * /add
GOTO :EOF

:START2
set /p accountd="削除するユーザーアカウント名を入力してください。"
net user %accountd% /delete
GOTO :EOF