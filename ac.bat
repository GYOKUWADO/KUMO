@echo off
IF "%1"=="" GOTO :HELP
IF "%1"=="/a" GOTO :START1
IF "%1"=="/d" GOTO :START2
GOTO :EOF
:HELP
echo ac /a
echo ac /d
echo #########
echo /a ���[�U�[�A�J�E���g�̒ǉ�
echo /d ���[�U�[�A�J�E���g�̍폜
GOTO :EOF
:START1

set /p account="�ǉ����郆�[�U�[�A�J�E���g������͂��Ă��������B"
REM echo %account%
net user %account% * /add
GOTO :EOF

:START2
set /p accountd="�폜���郆�[�U�[�A�J�E���g������͂��Ă��������B"
net user %accountd% /delete
GOTO :EOF