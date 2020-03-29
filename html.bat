@echo off
set /p filename="�t�@�C��������͂��Ă��������B:([�t�@�C����].html)"
set /p title="[title] html�̃^�C�g������͂��ĉ������B:"
set /p author="[author] ���҂̖��O����͂��Ă��������B:"
set /p description="[description] ���̃t�@�C���̐�������͂��ĉ������B:"
set /p keywords="[keywords] �L�[���[�h���J���}�ŋ�؂��ē��͂��Ă�������:"
set date_of_day=%date:~0,4%-%date:~5,2%-%date:~8,2%
set /p generater="[generater] �ҏW����G�f�B�^�[������͂��ĉ������B:"

:STRAT1
set /p YorN="[robots] �����G���W���ɓo�^�����܂����H:(y/n)"
IF "%YorN%"=="" GOTO :STRAT1
IF "%YorN%"=="y" set robots=index
IF "%YorN%"=="n" set robots=noindex

echo ^<^!doctype html^> > %filename%.html
echo ^<html^> >> %filename%.html
echo ^<head^> >> %filename%.html
echo ^<title^>%title%^<^/title^> >> %filename%.html
echo ^<meta http-equiv^=^"Content-Type^" content^=^"text^/html^" charset^=^"UTF-8^" ^/^> >> %filename%.html
echo ^<meta http-equiv^=^"Content-style-Type^" content^=^"text^/css^" ^/^> >> %filename%.html
echo ^<meta http-equiv^=^"Content-Script-Type^" content^=^"text^/javascript^" ^/^> >> %filename%.html
echo ^<meta name^=^"author^" content^=^"%author%^" ^/^> >> %filename%.html
echo ^<meta name^=^"description^" content^=^"%description%^" ^/^> >> %filename%.html
echo ^<meta name^=^"keywords^" content^=^"%keywords%^" ^/^> >> %filename%.html
echo ^<meta name^=^"date^" content^=^"%date_of_day%^"^> >> %filename%.html
echo ^<meta name^=^"generater^" content^=^"%generater%^" ^/^> >> %filename%.html
echo ^<meta name^=^"robots^" content^=^"%robots%^"^> >> %filename%.html
echo ^<^/head^> >> %filename%.html
echo ^<body^> >> %filename%.html
echo ^<^/body^> >> %filename%.html
echo ^<^/html^> >> %filename%.html